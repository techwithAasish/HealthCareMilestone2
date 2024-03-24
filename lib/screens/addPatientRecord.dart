import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milestone2/screens/homeScreen.dart';

class Patient {
  String firstName = '';
  String lastName = '';
  String dateOfBirth = '';
  String gender = '';
  String phoneNumber = '';
  String emailAddress = '';
  String address = '';
}

class AddPatientRecord extends StatefulWidget {
  const AddPatientRecord({Key? key}) : super(key: key);

  @override
  State<AddPatientRecord> createState() => _AddPatientRecordState();
}

class _AddPatientRecordState extends State<AddPatientRecord> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();

  // final String apiUrl = 'https://patient-backend-krc3.onrender.com/patients';
  final String apiUrl = 'http://localhost:3000/patients';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the first name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.firstName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the last name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.lastName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                validator: (value) {
                  // You can add more sophisticated date validation if needed
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date of birth';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.dateOfBirth = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the gender';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.gender = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.emailAddress = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.address = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  // onPressed: _postData,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // You can add logic here to save the patient record
                      // For now, let's print the patient information
                      _postData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // adding patient info
  Future<void> _postData() async {
    try {
      final response = await http.post(
        // Uri.parse('http://localhost:3000/patients'),
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // headers: {
        //   "Access-Control-Allow-Origin": "*",
        //   'Content-Type': 'application/json',
        //   'Accept': '*/*'
        // },
        body: jsonEncode(<String, dynamic>{
          'first_name': _patient.firstName,
          'last_name': _patient.lastName,
          'date_of_birth': _patient.dateOfBirth,
          'gender': _patient.gender,
          'phoneNumber': _patient.phoneNumber,
          'email_address': _patient.emailAddress,
          'address': _patient.address,
        }),
      );

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        print(responseData);
        print(_patient.firstName);
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print("excepion");
      print(e);
    }
  }
}
