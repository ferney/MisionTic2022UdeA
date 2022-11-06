import 'package:flutter/material.dart';

class Article {
  final int id;
  final String author_name;
  final String title;
  final String summary;

  Article(
      {@required this.id,
      @required this.author_name,
      @required this.title,
      @required this.summary});
}

class ArticleView extends StatelessWidget {
  final Article _article;

  ArticleView({@required Article article}) : _article = article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_article.title}'),
      ),
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            children: <Widget>[
              Text('${_article.author_name}'),
              Text('${_article.summary}'),
            ],
          ),
        ),
      ),
    );
  }
}
