import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/login_page.dart';
import 'package:hive_test/main.dart';
import 'package:hive_test/user.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hive_test/main.dart' as app;
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // final binding = IntegrationTestWidgetsFlutterBinding();
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('hive test',
        (tester) async {
      app.main();
      // await tester.pumpWidget(const MyApp());
      await tester.pumpWidget(MultiProvider(providers: [
        ChangeNotifierProvider(create:(_)=>User())
      ],child:const MyApp() ,));
      await tester.pumpAndSettle();
      final eposemail = find.byKey(const Key("emailf"));
      final epospassword = find.byKey(const Key('passwordf'));
      final eposlogin = find.byKey(const Key("epos login"));
      final remember = find.byKey(const Key("remember me"));
      await tester.enterText(eposemail, 'vamshi1@fininfocom.com');
      // await binding.takeScreenshot('test-screenshot');
      await Future.delayed(const Duration(seconds: 4));
      await tester.enterText(epospassword, 'epos1234');
      await Future.delayed(const Duration(seconds: 4));
      await tester.tap(remember);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(eposlogin);
      await tester.pumpAndSettle(const Duration(seconds: 4));
      // final back2 fin home = find.byKey(Key("back2 fin home"));
      // await tester.tap(back2 fin home);
      // await tester.pumpAndSettle(const Duration(seconds: 5));
// Warning thrown on this tap - tap never executed
          await tester.ensureVisible(find.text('You are in ePOS now'));
          await tester.tap(find.text('You are in ePOS now'));
          final next = find.byKey(const Key("next"));
          await tester.tap(next);
          await tester.pumpAndSettle(const Duration(seconds: 5));
          // await binding.convertFlutterSurfaceToImage();
          // await tester.pumpAndSettle();
          // await binding.takeScreenshot('screenshots/screenshot.png');
          // await tester.pumpAndSettle();
          await tester.ensureVisible(find.text('Come back Soon!'));
          await tester.tap(find.text('Come back Soon!'));
          await tester.pumpAndSettle();
          // await tester.pumpAndSettle();
      // final back_to_epos_login = find.byKey(Key("back"));
      // await tester.tap(back_to_epos_login);
      // await tester.pumpAndSettle(const Duration(seconds: 3));
      // await tester.pumpAndSettle();
        });
  });
}

