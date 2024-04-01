import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Patient {
  String firstName = '';
  String lastName = '';
  String dateOfBirth = '';
  String gender = '';
  String phoneNumber = '';
  String emailAddress = '';
  String address = '';
}

class UpdatePatientRecord extends StatefulWidget {
  const UpdatePatientRecord({Key? key}) : super(key: key);

  @override
  State<UpdatePatientRecord> createState() => _AddPatientRecordState();
}

class _AddPatientRecordState extends State<UpdatePatientRecord> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();

  final String apiUrl =
      'http://localhost:3000/patients/6602296d32ef883fdf84e862';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Patient Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Patient ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient id';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.firstName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
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
                    return 'Please enter last name';
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
                    return 'Please enter date of birth';
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
                    return 'Please enter gender';
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
                    return 'Please enter phone number';
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
                    return 'Please enter email address';
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
                    return 'Please enter address';
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _updateData();
                    }
                  },
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // update patient info
  Future<void> _updateData() async {
    try {
      final response = await http.put(
        // Uri.parse('http://0.0.0.0:3000/patients/6602296d32ef883fdf84e862'),
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body: jsonEncode(<String, dynamic>{
          'first_name': _patient.firstName,
          'last_name': _patient.lastName,
          'address': _patient.address,
          'date_of_birth': _patient.dateOfBirth,
          'gender': _patient.gender,
          'phoneNumber': _patient.phoneNumber,
          'email_address': _patient.emailAddress,
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
