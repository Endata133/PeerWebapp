import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Ensure you're importing the correct main file

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    // Build the LoginApp and trigger a frame.
    await tester.pumpWidget(const LoginApp());

    // Verify that the "Welcome back!" text is displayed on the login screen.
    expect(find.text('Welcome back!'), findsOneWidget);

    // Verify that the "Login" button is displayed.
    expect(find.text('Login'), findsOneWidget);
  });
}
