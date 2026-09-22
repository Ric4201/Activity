import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messy_catalog_activity/main.dart';

void main() {
  testWidgets('Renders all initial products and header', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Messy Catalog'), findsOneWidget);

    expect(find.text('Search Products'), findsOneWidget);

    expect(find.text('Catalog'), findsOneWidget);

    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('Mechanical Keyboard'), findsOneWidget);
    expect(find.text('Ceramic Mug'), findsOneWidget);
    expect(find.text('Notebook'), findsOneWidget);
    expect(find.text('Desk Lamp'), findsOneWidget);
    expect(find.text('Backpack'), findsOneWidget);
    expect(find.text('Water Bottle'), findsOneWidget);
  });

  testWidgets('Search query filters product catalog correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final searchInput = find.byWidgetPredicate(
      (widget) => widget is TextField && widget.decoration?.hintText == 'Type a product name...',
    );
    expect(searchInput, findsOneWidget);

    await tester.enterText(searchInput, 'Mouse');
    await tester.pumpAndSettle();

    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('Mechanical Keyboard'), findsNothing);
    expect(find.text('Ceramic Mug'), findsNothing);
  });

  testWidgets('Add to cart button displays feedback SnackBar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final addToCartButtons = find.widgetWithText(ElevatedButton, 'Add to Cart');
    expect(addToCartButtons, findsWidgets);

    await tester.tap(addToCartButtons.first);
    await tester.pump();

    expect(find.text('Added Wireless Mouse to cart'), findsOneWidget);
  });

  testWidgets('Delete button removes product from catalog', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Wireless Mouse'), findsOneWidget);

    final deleteButtons = find.byIcon(Icons.delete_outline);
    await tester.tap(deleteButtons.first);
    await tester.pumpAndSettle();

    expect(find.text('Wireless Mouse'), findsNothing);
  });

  testWidgets('Form validation shows errors on invalid inputs', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final submitButton = find.widgetWithText(ElevatedButton, 'Submit Product');
    await tester.ensureVisible(submitButton);
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.text('Product name is required'), findsOneWidget);
    expect(find.text('Price is required'), findsOneWidget);
  });

  testWidgets('Adding new product adds it to catalog and displays confirmation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final submitButton = find.widgetWithText(ElevatedButton, 'Submit Product');
    await tester.ensureVisible(submitButton);

    final nameField = find.widgetWithText(TextFormField, 'Product Name');
    final priceField = find.widgetWithText(TextFormField, 'Price');
    final descField = find.widgetWithText(TextFormField, 'Description');

    await tester.enterText(nameField, 'Gaming Headset');
    await tester.enterText(priceField, '1599.0');
    await tester.enterText(descField, 'Surround sound noise-cancelling');
    await tester.pumpAndSettle();

    await tester.tap(submitButton);
    await tester.pump();

    expect(find.text('Gaming Headset added to catalog!'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Gaming Headset'), findsOneWidget);
    expect(find.text('PHP 1599.00'), findsOneWidget);
  });
}
