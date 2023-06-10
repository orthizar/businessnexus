import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:businessnexus/screens/overview_screen.dart';
 void main() {
  group('OverviewScreenState', () {
    testWidgets('should display a list of companies', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: OverviewScreen()));
       // Assert
      expect(find.byType(ListTile), findsNWidgets(3));
    });
    //  testWidgets('should navigate to business details screen when a company is tapped', (WidgetTester tester) async {
    //   // Arrange
    //   await tester.pumpWidget(const MaterialApp(home: OverviewScreen()));
    //   final companyTileFinder = find.widgetWithText(ListTile, 'Company A');
    //    // Act
    //   await tester.tap(companyTileFinder);
    //   await tester.pumpAndSettle();
    //    // Assert
    //   expect(find.text('Business Details'), findsOneWidget);
    // });
     testWidgets('should display a new company when _createNewCompany is called', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: OverviewScreen()));
      final initialLength = find.byType(ListTile).evaluate().length;
       // Act
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
       // Assert
      expect(find.byType(ListTile), findsNWidgets(initialLength + 1));
      expect(find.widgetWithText(ListTile, 'New Company'), findsOneWidget);
    });
  });
}