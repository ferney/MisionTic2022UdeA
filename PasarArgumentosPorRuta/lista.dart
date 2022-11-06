import 'package:flutter/material.dart';
import 'detalles.dart' show Article;

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List<Article> articles = [
    Article(
        id: 1,
        title: 'Articulo 1',
        author_name: 'xyz',
        summary: 'xyz'),
    Article(
        id: 2,
        title: 'zzz',
        author_name: 'zzz',
        summary: 'zzz'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('${articles[0].title}'),
              subtitle: Text('by ${articles[0].author_name}'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/ArticleView', arguments: articles[0]);
              },
            ),
            ListTile(
              title: Text('${articles[1].title}'),
              subtitle: Text('by ${articles[1].author_name}'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/ArticleView', arguments: articles[1]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
