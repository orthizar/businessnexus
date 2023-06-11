import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:businessnexus/screens/overview_screen.dart';
import 'package:get/get.dart';

void main() {
  group('OverviewScreen', () {
    testWidgets('should display an empty list of businesses',
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: OverviewScreen()));

      expect(find.byType(ListTile), findsNWidgets(0));
    });
  });
}
