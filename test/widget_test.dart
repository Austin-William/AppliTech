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
    'AppliTech Widget smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const AppliTech());
    },
  );
  testWidgets(
    'Login Widget smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const Login());
    },
  );
  testWidgets(
    'Home Widget smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const Home());
    },
  );
  testWidgets(
    'Notes page smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const NotesPage());
    },
  );
  testWidgets(
    'Profile page smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProfilePage());
    },
  );
  testWidgets(
    'Calendar page smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const CalendarPage());
    },
  );
  testWidgets(
    'Help page smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const HelpPage());
    },
  );
  testWidgets(
    'AppliTech Widget smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const AppliTech());
    },
  );
  testWidgets(
    'Settings page smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const SettingsPage());
    },
  );
}
