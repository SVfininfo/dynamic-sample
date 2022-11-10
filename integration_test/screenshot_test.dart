import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/main.dart';
import 'package:integration_test/integration_test.dart';


void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
  IntegrationTestWidgetsFlutterBinding();

  // TODO: Write the test here
  testWidgets('screenshot', (WidgetTester tester) async {
    // Render the UI of the app
    await tester.pumpWidget(const MyApp());

    String platformName = '';

    if (!kIsWeb) {
      // Not required for the web. This is required prior to taking the screenshot.
      await binding.convertFlutterSurfaceToImage();

      if (Platform.isAndroid) {
        platformName = "android";
      } else {
        platformName = "ios";
      }
    } else {
      platformName = "web";
    }
    // To make sure at least one frame has rendered
    await tester.pumpAndSettle();
    // Take the screenshot
    await binding.takeScreenshot('screenshot-$platformName');

  });
}
