import 'package:flutter/material.dart';

import 'lista.dart';
import 'detalles.dart';

Widget makeRoute(
    {@required BuildContext context,
    @required String routeName,
    Object arguments}) {
  final Widget child =
      _buildRoute(context: context, routeName: routeName, arguments: arguments);
  return child;
}

Widget _buildRoute({
  @required BuildContext context,
  @required String routeName,
  Object arguments,
}) {
  switch (routeName) {
    case '/':
      return ArticleList();
    case '/ArticleView':
      Article article = arguments as Article;
      return ArticleView(article: article);
    default:
      throw 'Route $routeName is not defined';
  }
}
