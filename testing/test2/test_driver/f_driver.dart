/*import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_driver/flutter_driver.dart' as driver;

Future<void> main() {
  return integrationDriver(responseDataCallback: (data) async {
    if (data != null) {
      final timeline = driver.Timeline.fromJson(data['scrolll']);

      final summary = driver.TimelineSummary.summary(timeline);

      await summary.writeTimelineToFile(
        'scrill',
        pretty: true,
        includeSummary: true,
      );
    }
  });
}*/
