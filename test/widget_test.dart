
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/screens/login_screen.dart';

void main() {
  testWidgets('Login form shows validation errors', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    await tester.tap(find.text('Log in').first);
    await tester.pumpAndSettle();

    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}
