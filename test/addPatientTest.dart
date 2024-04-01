import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:milestone2/screens/addPatientRecord.dart';
import 'package:milestone2/screens/homeScreen.dart';

// Create a mock HTTP client
class MockClient extends Mock implements http.Client {}

void main() {
  group('AddPatientRecord Integration Test', () {
    testWidgets('Submitting patient record triggers HTTP POST request',
        (WidgetTester tester) async {
      // Mock HTTP client
      final MockClient client = MockClient();

      // Build our app and trigger a frame
      await tester.pumpWidget(MaterialApp(
        home: AddPatientRecord(client: client),
      ));

      // Fill in the form fields
      await tester.enterText(
          find.byKey(const ValueKey('firstNameField')), 'John');
      await tester.enterText(
          find.byKey(const ValueKey('lastNameField')), 'Doe');
      await tester.enterText(
          find.byKey(const ValueKey('dateOfBirthField')), '1990-01-01');
      await tester.enterText(find.byKey(const ValueKey('genderField')), 'Male');
      await tester.enterText(
          find.byKey(const ValueKey('phoneNumberField')), '1234567890');
      await tester.enterText(find.byKey(const ValueKey('emailAddressField')),
          'john.doe@example.com');
      await tester.enterText(
          find.byKey(const ValueKey('addressField')), '123 Street');

      // Tap the submit button
      await tester.tap(find.byKey(const ValueKey('submitButton')));
      await tester.pump();

      // Verify that a POST request was made to the server
      verify(client.post(
        Uri.parse('http://localhost:3000/patients'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).called(1);

      // Verify navigation to HomeScreen
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
