
class FavoriteListModel {
 
  static List<String> itemNames = [
    'Admob Ads',
    'Android Studio',
    'Angularjs',
    'Bootstrap',
    'C-sharp',
    'Flutter Apps',
    'intellij-idea',
    'java-coffee',
    'json',
    'kotlin',
    'PHP Designer',
    'python',
    'React Native',
    'Stack over flow',
    'Unity 5',
  ];

  
  static List<String> itemSubtitle = [
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
    'some app for any developer',
  ];

 
  static List<String> itemImages = [
    ("assets/admob.png"),
    ("assets/android-studio.png"),
    ("assets/angularjs.png"),
    ("assets/bootstrap.png"),
    ("assets/c-sharp.png"),
    ("assets/flutter.png"),
    ("assets/intellij-idea.png"),
    ("assets/java.png"),
    ("assets/json.png"),
    ("assets/kotlin.png"),
    ("assets/php-designer.png"),
    ("assets/python.png"),
    ("assets/react-native.png"),
    ("assets/stackoverflow.png"),
    ("assets/unity-5.png"),
  ];

  
  Item getById(int id) => Item(
        id,
        itemNames[id % itemNames.length],
        itemSubtitle[id % itemSubtitle.length],
        itemImages[id % itemImages.length],
      );

  
  Item getByPosition(int position) {
    
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String subtitle;
  final String image;

  const Item(
    this.id,
    this.name,
    this.subtitle,
    this.image,
  );

  
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
