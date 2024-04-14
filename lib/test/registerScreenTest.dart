import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone2/screens/signupPage.dart';

void main() {
  testWidgets('Registration form test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: RegisterScreen(),
    ));

    // Verify if the Sign Up Form title is rendered.
    expect(find.text('Sign Up Form'), findsOneWidget);

    // Enter invalid email
    await tester.enterText(find.byKey(const ValueKey('email')), 'invalidemail');
    await tester.pump(); // Rebuild the widget with the new state
    expect(find.text('Please enter a valid email address'), findsOneWidget);

    // Enter valid email
    await tester.enterText(
        find.byKey(const ValueKey('email')), 'valid@email.com');
    await tester.pump();
    expect(find.text('Please enter a valid email address'), findsNothing);

    // Enter invalid password
    await tester.enterText(find.byKey(const ValueKey('password')), 'short');
    await tester.pump();
    expect(find.text('Password must be at least 6 characters long'),
        findsOneWidget);

    // Enter valid password
    await tester.enterText(
        find.byKey(const ValueKey('password')), 'validpassword');
    await tester.pump();
    expect(
        find.text('Password must be at least 6 characters long'), findsNothing);

    // Confirm password mismatch
    await tester.enterText(
        find.byKey(const ValueKey('confirm_password')), 'mismatchedpassword');
    await tester.pump();
    expect(find.text('Passwords do not match'), findsOneWidget);

    // Confirm password match
    await tester.enterText(
        find.byKey(const ValueKey('confirm_password')), 'validpassword');
    await tester.pump();
    expect(find.text('Passwords do not match'), findsNothing);

    // Tap the register button and verify if registration successful message is printed
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Registration successful'), findsOneWidget);
  });
}
