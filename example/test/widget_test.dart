import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../lib/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Find slider and get its size to measure how much to slide
    final confirmationSlider = find.byType(ConfirmationSlider);
    final sliderSize = tester.getSize(confirmationSlider);

    // Slide the icon and trigger a frame.
    await tester.drag(find.descendant(of: confirmationSlider, matching: find.byKey(const Key("ContentContainer"))), Offset(sliderSize.width, 0));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
