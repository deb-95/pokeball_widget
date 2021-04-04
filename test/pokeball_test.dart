import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokeball_widget/pokeball_widget.dart';

void main() {
  testWidgets(
    "PokeBallWidget should correctly render",
    (WidgetTester tester) async {
      final testKey = Key('PokeBallWidget');
      final painterColor = Colors.green;
      final painterOpacity = 0.6;
      await tester.pumpWidget(
        PokeBallWidget(
          key: testKey,
          color: painterColor,
          opacity: painterOpacity,
        ),
      );
      final byKey = find.byKey(testKey);
      CustomPaint customPaint = byKey.evaluate().single.widget as CustomPaint;
      PokeBallPainter found = customPaint.painter as PokeBallPainter;

      expect(byKey, findsOneWidget);
      expect(customPaint.painter, equals(found));
      expect(found.color, equals(painterColor));
      expect(found.opacity, equals(painterOpacity));
    },
  );
}
