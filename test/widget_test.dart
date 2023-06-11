import 'package:businessnexus/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OverviewScreen', () {
    testWidgets('should display an empty list of businesses',
        (WidgetTester tester) async {
      await tester.pumpWidget(BusinessNexusApp());

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text("No businesses yet."), findsOneWidget);
    });
  });
}
