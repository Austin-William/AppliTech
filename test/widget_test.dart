import 'package:applitech/app.dart';
import 'package:applitech/pages/home.dart';
import 'package:applitech/pages/login.dart';
import 'package:applitech/pages/routes/calendar_page.dart';
import 'package:applitech/pages/routes/help_page.dart';
import 'package:applitech/pages/routes/notes_page.dart';
import 'package:applitech/pages/routes/profile_page.dart';
import 'package:applitech/pages/routes/settings_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Counter increments smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const AppliTech());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const Home());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const Login());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const SettingsPage());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const NotesPage());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const CalendarPage());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProfilePage());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const HelpPage());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    },
  );
}
