import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_template/main.dart' as app;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('main', () {
    testWidgets('renders SplashScreen initially', (WidgetTester tester) async {
      app.main();
      await expectLater(
        find.byType(app.SplashScreen),
        matchesGoldenFile('goldens/splash_screen.png'),
      );
    });
    testWidgets('renders MainApp after pump', (WidgetTester tester) async {
      app.main();
      await tester.pump();
      await expectLater(
        find.byType(app.MainApp),
        matchesGoldenFile('goldens/main_app.png'),
      );
    });
  });
}
