import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model.dart';

class Hive_CRUD extends StatefulWidget {
  @override
  State<Hive_CRUD> createState() => _Hive_CRUD_State();
}

class _Hive_CRUD_State extends State<Hive_CRUD> {
  late TextEditingController controller;
  late TextEditingController controller2;

  late Box<Item> itemBox;
  late Item myitem, myitem2;



  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
    itemBox = Hive.box("itemBox");

  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive CRUD (Flutter)'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 180,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Create item',
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  myitem = Item(name: controller.text);
                  create(item: myitem);
                  controller.clear();
                },
                child: const Text("Create"),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 30,
          ),
      Expanded(
        child: ValueListenableBuilder(
          valueListenable: itemBox.listenable(),
          builder: (context, Box<Item> box, _){
            List<Item> item = box.values.toList().cast<Item>();
              return ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(item[index].name),
                    leading: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(child: const Text('Update')),
                              content: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: TextField(
                                      controller: controller2,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                    child: const Text('Cancel', style: TextStyle(color: Colors.red),),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                                TextButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      myitem2 = Item(name: controller2.text);
                                      update(idx: index,item: myitem2);
                                      controller2.clear();
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: const Text("Update"),
                    ),
                    trailing: Wrap(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () {
                            delete(idx: index);
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    ),
                  );
                });
           },
        ),
      ),
        ],
      ),
    );
  }
}
