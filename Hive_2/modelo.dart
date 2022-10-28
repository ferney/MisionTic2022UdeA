import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'modelo.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject{
  @HiveField(0)
  String name;
  Item({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };

  static Item fromJson(Map<String,dynamic> json) => Item(
    name: json['name'],
  );
}

Future create({required Item item}) async {
   Box<Item> _box = Hive.box("itemBox");
   await _box.add(item);
}

Future delete({required int idx}) async {
  Box<Item> _box = Hive.box("itemBox");
  await _box.deleteAt(idx);
}

Future update({required int idx,required Item item}) async{
  Box<Item> _box = Hive.box("itemBox");
  await _box.putAt(idx, item);
}
