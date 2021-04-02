import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokeball/pokeball.dart';

void main() {
  testWidgets(
    "PokeBallPaint should correctly render",
    (WidgetTester tester) async {
      final testKey = Key('PokeBallPainter');
      await tester.pumpWidget(
        PokeBallPaint(key: testKey, color: Colors.red),
      );
      expect(find.byKey(testKey), findsOneWidget);
    },
  );
  testWidgets("PokeBallPainter should correctly render with custom parameters",
      (WidgetTester tester) async {
    final testKey = Key('CustomPaint');
    final painterColor = Colors.green;
    final painterOpacity = 0.6;
    final painter =
        PokeBallPainter(color: painterColor, opacity: painterOpacity);
    await tester.pumpWidget(
      CustomPaint(
        key: testKey,
        painter: painter,
      ),
    );
    final byKey = find.byKey(testKey);
    CustomPaint customPaint = byKey.evaluate().single.widget as CustomPaint;
    PokeBallPainter found = customPaint.painter as PokeBallPainter;

    expect(byKey, findsOneWidget);
    expect(customPaint.painter, equals(painter));
    expect(found.color, equals(painterColor));
    expect(found.opacity, equals(painterOpacity));
  });
}
