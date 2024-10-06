import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_template/main.dart' as app;

void main() {
  group('main', () {
    testWidgets('renders SplashScreen then MainApp',
        (WidgetTester tester) async {
      app.main();
      expect(find.byType(app.SplashScreen), findsOneWidget);
      await tester.pump();
      expect(find.byType(app.MainApp), findsOneWidget);
    });
  });
}
