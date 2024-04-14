import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:milestone2/screens/addPatientRecord.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('_AddPatientRecordState tests', () {
    late _AddPatientRecordState state;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      state = _AddPatientRecordState();
    });

    test('_postData success', () async {
      // Prepare the test data
      state._formKey.currentState = GlobalKey<FormState>().currentState!;
      state._patient.firstName = 'John';
      state._patient.lastName = 'Doe';
      state._patient.address = '123 Main St';
      state._patient.dateOfBirth = '1990-01-01';
      state._patient.gender = 'Male';
      state._patient.phoneNumber = '1234567890';
      state._patient.emailAddress = 'john.doe@example.com';

      final response = http.Response(jsonEncode({'status': 'success'}), 201);

      when(mockHttpClient.post(
        Uri.parse('http://localhost:3000/patients'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => response);

      // Call the method and verify
      await state._postData();

      // Verify the request is made
      verify(mockHttpClient.post(
        Uri.parse('http://localhost:3000/patients'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(<String, dynamic>{
          'first_name': 'John',
          'last_name': 'Doe',
          'address': '123 Main St',
          'date_of_birth': '1990-01-01',
          'gender': 'Male',
          'phoneNumber': '1234567890',
          'email_address': 'john.doe@example.com',
        }),
      )).called(1);
    });

    test('_postData failure', () async {
      // Prepare the test data
      state._formKey.currentState = GlobalKey<FormState>().currentState!;
      state._patient.firstName = 'John';
      state._patient.lastName = 'Doe';
      // Other fields can be left blank to simulate a failed request

      final response = http.Response('Failed to post data', 500);

      when(mockHttpClient.post(
        Uri.parse('http://localhost:3000/patients'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => response);

      // Call the method and verify
      expect(() => state._postData(), throwsException);
    });
  });
}
