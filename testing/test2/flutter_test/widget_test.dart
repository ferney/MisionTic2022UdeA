import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test con titulo y mensaje', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: 'title', message: 'message'));

    final titleFinder = find.text('title');
    final messageFinder = find.text('message');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required this.title, required this.message})
      : super(key: key);

  final String title, message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xyz',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
