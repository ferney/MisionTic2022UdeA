/*import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  testWidgets('xyz', (widgetTester) async {
    //xyz
    await tester.pumpWidget(MyApp(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('value'));

    await binding.traceAction(
      () async {
        await tester.scrollUntilVisible(
          itemFinder,
          500.0,
          Scrollable: listFinder,
        );
      },
      reportKey: 'scroll e  apantalla',
    );
  });
}*/
