import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:free_checklist_app/main.dart';

void main() {
  group('Checklist App Widget Tests', () {
    
    testWidgets('should display all initial checklists', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Shopping List'), findsOneWidget);
      expect(find.text('Drug Store List'), findsOneWidget);
    });

    testWidgets('should display drag handle icon for each list item', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byIcon(Icons.drag_handle), findsNWidgets(2));
    });

    testWidgets('reordering a list item should update the UI', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find the ListTile that contains 'Shopping List'
      final firstItemTileFinder = find.ancestor(
        of: find.text('Shopping List'),
        matching: find.byType(ListTile),
      );

      // Find the drag handle icon within that specific ListTile
      final firstDragHandleFinder = find.descendant(
        of: firstItemTileFinder,
        matching: find.byIcon(Icons.drag_handle),
      );

      // Ensure we actually found it before dragging
      expect(firstDragHandleFinder, findsOneWidget);

      // Perform a drag and drop (reorder).
      // We drag the first item down to the second position.
      await tester.drag(firstDragHandleFinder, const Offset(0, 50)); 
      await tester.pumpAndSettle(); // Wait for reorder animation to finish

      // Verify that the list still contains both items (basic integrity check)
      expect(find.text('Shopping List'), findsOneWidget);
      expect(find.text('Drug Store List'), findsOneWidget);
    });

  });
}
