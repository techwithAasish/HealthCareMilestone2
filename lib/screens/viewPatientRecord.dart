import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientInfoTableScreen extends StatefulWidget {
  const PatientInfoTableScreen({Key? key}) : super(key: key);

  @override
  _PatientInfoTableScreenState createState() => _PatientInfoTableScreenState();
}

class _PatientInfoTableScreenState extends State<PatientInfoTableScreen> {
  List<Map<String, dynamic>> patientData = [];

  @override
  void initState() {
    super.initState();
    // Fetch patient data when the widget initializes
    fetchPatientInfo();
  }

  Future<void> fetchPatientInfo() async {
    try {
      // Make GET request to fetch patient data
      final response =
          await http.get(Uri.parse('http://localhost:3000/patients'));

      if (response.statusCode == 200) {
        // If request is successful, decode JSON response
        final List<dynamic> jsonData = json.decode(response.body);

        setState(() {
          // Update patientData list with received data
          patientData = jsonData
              .map((patient) => Map<String, dynamic>.from(patient))
              .toList();
        });

        print(patientData);
      } else {
        // Handle error if request fails
        throw Exception('Failed to load patient data');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('First Name')),
            DataColumn(label: Text('Last Name')),
            DataColumn(label: Text('Date of Birth')),
            DataColumn(label: Text('Gender')),
            DataColumn(label: Text('Phone number')),
            DataColumn(label: Text('Email Address')),
            DataColumn(label: Text('Address')),
          ],
          rows: patientData.map((patient) {
            return DataRow(
              cells: [
                DataCell(Text(patient['_id'].toString())),
                DataCell(Text(patient['first_name'])),
                DataCell(Text(patient['last_name'])),
                DataCell(Text(patient['date_of_birth'])),
                DataCell(Text(patient['gender'])),
                DataCell(Text(patient['phoneNumber'])),
                DataCell(Text(patient['email_address'])),
                DataCell(Text(patient['address'])),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
