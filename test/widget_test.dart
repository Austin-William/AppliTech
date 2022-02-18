// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:applitech/app.dart';
import 'package:applitech/pages/home.dart';
import 'package:applitech/pages/login.dart';
import 'package:applitech/pages/routes/absences_page.dart';
import 'package:applitech/pages/routes/calendar_page.dart';
import 'package:applitech/pages/routes/help_page.dart';
import 'package:applitech/pages/routes/module_page.dart';
import 'package:applitech/pages/routes/notes_page.dart';
import 'package:applitech/pages/routes/notifications_page.dart';
import 'package:applitech/pages/routes/profile_page.dart';
import 'package:applitech/pages/routes/projects_page.dart';
import 'package:applitech/pages/routes/settings_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:applitech/global/variables.dart' as global;

void main() {
  // Check main
  group("Main test : ", () {
    // Check app

    group("App test : ", () {
      test('app.dart file', () {
        expect(const AppliTech(), isNotNull);
      });
    });

    // Check home page

    group("Home test : ", () {
      test('home.dart file', () {
        expect(const Home(), isNotNull);
      });
    });

    // Check absences route

    group("Absences test : ", () {
      test('absences_page.dart file', () {
        expect(const AbsencesPage(), isNotNull);
      });
    });

    // Check calendar route

    group("Calendar test : ", () {
      test('calendar_page.dart file', () {
        expect(const CalendarPage(), isNotNull);
      });
    });

    // Check help route

    group("Help test : ", () {
      test('help.dart file', () {
        expect(const HelpPage(), isNotNull);
      });
    });

    // Check module route

    group("Module test : ", () {
      test('module_page.dart file', () {
        expect(const ModulePage(), isNotNull);
      });
    });

    // Check notes route

    group("Notes test : ", () {
      test('notes_page.dart file', () {
        expect(const NotesPage(), isNotNull);
      });
    });

    // Check notifications route

    group("Notifications test : ", () {
      test('notifications_page.dart file', () {
        expect(const NotificationsPage(), isNotNull);
      });
    });

    // Check profile route

    group("Profile test : ", () {
      test('profile_page.dart file', () {
        expect(const ProfilePage(), isNotNull);
      });
    });

    // Check projects route

    group("Projects test : ", () {
      test('projects_page.dart file', () {
        expect(const ProjectsPage(), isNotNull);
      });
    });

    // Check home page

    group("Home test : ", () {
      test('home.dart file', () {
        expect(const Home(), isNotNull);
      });
    });

    // Check Login page
    group("Login test : ", () {
      test('login.dart file', () {
        expect(Login, isNotNull);
      });
      Widget makeTestableWidget(Widget widget) {
        return const MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: Login(),
          ),
        );
      }

      testWidgets('textfield check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(TextField), findsOneWidget);
      });

      testWidgets('elevated buttons check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(ElevatedButton), findsWidgets);
      });

      testWidgets('texts widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Text), findsWidgets);
      });

      testWidgets('column widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Column), findsWidgets);
      });

      testWidgets('navigator widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Navigator), findsWidgets);
      });

      testWidgets('center widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Center), findsWidgets);
      });

      testWidgets('flexible widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Flexible), findsWidgets);
      });

      testWidgets('sized box widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(SizedBox), findsWidgets);
      });

      testWidgets('material widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Material), findsWidgets);
      });

      testWidgets('icons widget check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Icon), findsWidgets);
      });

      testWidgets('padding check', (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(const Login()));
        expect(find.byType(Padding), findsWidgets);
      });
    });

    // Check Settings page

    group("Settings page : ", () {
      test('settings.dart file', () {
        expect(const SettingsPage(), isNotNull);
      });
    });

    // Check global

    group("Global : ", () {
      test('global.dart file', () {
        expect(global.version, isNotEmpty);
        expect(global.userData, isNull);
        expect(global.homeData, isNull);
        expect(global.calendarData, isNull);
        expect(global.absencesData, isNull);
        expect(global.notificationsData, isNull);
        expect(global.isLoggedIn, isFalse);
        expect(global.isThemeDark, isFalse);
        expect(global.timerActivityComing, isNonZero);
      });
    });
  });
}
