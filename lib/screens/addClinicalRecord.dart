import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Patient {
  String patientID = '';
  String date = '';
  String bloodPressure = '';
  String respiratoryRate = '';
  String bloodOxygenLevel = '';
  String heartbeatRate = '';
  String conditionCritical = '';
}

class AddClinicalRecord extends StatefulWidget {
  const AddClinicalRecord({Key? key}) : super(key: key);

  @override
  State<AddClinicalRecord> createState() => _AddPatientRecordState();
}

class _AddPatientRecordState extends State<AddClinicalRecord> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();

  final String apiUrl =
      'http://localhost:3000/patients/66006da228881bbe7c8a1678/tests';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient Clinical Record'),
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
                  _patient.patientID = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter date';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.date = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Blood Pressure'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter blood pressure';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.bloodPressure = value!;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Respiratory Rate'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter respiratory rate';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.respiratoryRate = value!;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Blood Oxygen Level'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter blood oxygen level';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.bloodOxygenLevel = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Heartbeat Rate'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter heartbeat rate';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.heartbeatRate = value!;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Critical Condition'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter critical condition';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.conditionCritical = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // You can add logic here to save the patient record
                      // For now, let's print the patient information
                      _postClinicalData();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const HomeScreen(),
                      //   ),
                      // );
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

  // adding patient test info
  Future<void> _postClinicalData() async {
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
          'patientId': _patient.patientID,
          'date': _patient.date,
          'bloodPressure': _patient.bloodPressure,
          'respiratoryRate': _patient.respiratoryRate,
          'bloodOxygenLevel': _patient.bloodOxygenLevel,
          'heartbeatRate': _patient.heartbeatRate,
          'condition_critical': _patient.conditionCritical,
        }),
      );

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        print(responseData);
        print(_patient.patientID);
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
