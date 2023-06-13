import 'dart:math';

import 'package:businessnexus/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

String generateRandomString(int length) {
  final random = Random();
  return String.fromCharCodes(
    List.generate(length, (index) => random.nextInt(26) + 97),
  );
}

// Define functions for repeated actions
Future<void> createBusiness(WidgetTester tester, String businessName) async {
  await tester.tap(find.byIcon(Icons.add_business));
  await tester.pumpAndSettle();

  await tester.enterText(find.byType(TextField), businessName);
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();
}

Future<void> openBusinessDashboard(
    WidgetTester tester, String businessName) async {
  await tester.tap(find.text(businessName));
  await tester.pumpAndSettle();
}

void main() {
  group('OverviewScreen', () {
    testWidgets('should display an empty list of businesses',
        (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text("No businesses yet."), findsOneWidget);
    });
  });
  group('CreateBusinessScreen', () {
    testWidgets('should display a form to create a new business',
        (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());
      await tester.tap(find.byIcon(Icons.add_business));
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
    testWidgets('should create a new business when the form is submitted',
        (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());

      final String businessName = generateRandomString(10);
      final int initialNumberOfBusinesses = tester
          .widgetList(find.byType(ListTile))
          .where((element) =>
              ((element as ListTile).title as Text).data !=
              "No businesses yet.")
          .length;

      await createBusiness(tester, businessName);
      expect(
          find.byType(ListTile), findsNWidgets(initialNumberOfBusinesses + 1));
      expect(find.text(businessName), findsOneWidget);
    });
    testWidgets(
        'should create a new business when the form is submitted via enter key',
        (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());

      final String businessName = generateRandomString(10);
      final int initialNumberOfBusinesses = tester
          .widgetList(find.byType(ListTile))
          .where((element) =>
              ((element as ListTile).title as Text).data !=
              "No businesses yet.")
          .length;

      await tester.tap(find.byIcon(Icons.add_business));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), businessName);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(
          find.byType(ListTile), findsNWidgets(initialNumberOfBusinesses + 1));
      expect(find.text(businessName), findsOneWidget);
    });
  });
  group('BusinessDashboardScreen', () {
    testWidgets('should display the business name in the app bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());

      final String businessName = generateRandomString(10);

      await createBusiness(tester, businessName);
      await openBusinessDashboard(tester, businessName);

      AppBar appbar = tester.firstWidget(find.byType(AppBar));
      assert((appbar.title as Text).data == businessName);
    });
    testWidgets('should display module cards', (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());
      final String businessName = generateRandomString(10);
      await createBusiness(tester, businessName);
      await openBusinessDashboard(tester, businessName);

      expect(find.byType(Card), findsWidgets);
      expect(find.text("Finances"), findsOneWidget);
    });
  });
  // Switch to SettingsScreen and check if Appbar title is "Settings"
  group('SettingsScreen', () {
    testWidgets('should display the settings screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      AppBar appbar = tester.firstWidget(find.byType(AppBar));
      assert((appbar.title as Text).data == "Settings");
    });
  });
}
