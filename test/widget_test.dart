import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:businessnexus/screens/overview_screen.dart';
import 'package:get/get.dart';

void main() {
  group('OverviewScreen', () {
    testWidgets('should display an empty list of companies',
        (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(home: OverviewScreen()));

      expect(find.byType(ListTile), findsNWidgets(0));
    });
    // testWidgets('should display a list of companies',
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(const GetMaterialApp(home: OverviewScreen()));
    //   await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
    //   await tester.pumpAndSettle();
    //   await tester.enterText(find.byElementType(TextField), "Company A");
    //   await tester.tap(find.widgetWithText(ElevatedButton, "Create Company"));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(ListTile), findsNWidgets(1));
    // });
    // testWidgets(
    //     'should navigate to business details screen when a company is tapped',
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(const GetMaterialApp(home: OverviewScreen()));
    //   var fab = find.widgetWithIcon(FloatingActionButton, Icons.add);
    //   print(fab);
    //   await tester.tap(fab);
    //   await tester.pumpAndSettle();
    //   print(find.byElementType(TextField));
    //   await tester.
    //   await tester.enterText(find.byElementType(TextField), "Company A");
    //   await tester.tap(find.widgetWithText(ElevatedButton, "Create Company"));
    //   await tester.pumpAndSettle();
    //   final companyTileFinder = find.widgetWithText(ListTile, 'Company A');
    //   await tester.tap(companyTileFinder);
    //   await tester.pumpAndSettle();
    //   expect(find.text('Level: 1'), findsOneWidget);
    //   expect(find.text('Revenue: 0'), findsOneWidget);
    // });
  });
}
