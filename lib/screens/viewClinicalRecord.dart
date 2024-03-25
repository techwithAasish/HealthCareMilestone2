import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewClinicalRecord extends StatefulWidget {
  const ViewClinicalRecord({Key? key}) : super(key: key);

  @override
  _ViewClinicalRecord createState() => _ViewClinicalRecord();
}

class _ViewClinicalRecord extends State<ViewClinicalRecord> {
  List<Map<String, dynamic>> patientClinicalData = [];

  @override
  void initState() {
    super.initState();
    // Fetch patient data when the widget initializes
    fetchPatientClinicalInfo();
  }

  Future<void> fetchPatientClinicalInfo() async {
    try {
      // Make GET request to fetch patient data
      final response =
          await http.get(Uri.parse('http://localhost:3000/patients/tests'));

      if (response.statusCode == 200) {
        // If request is successful, decode JSON response
        final List<dynamic> jsonData = json.decode(response.body);

        setState(() {
          // Update patientData list with received data
          patientClinicalData = jsonData
              .map((patient) => Map<String, dynamic>.from(patient))
              .toList();
        });

        print(patientClinicalData);
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
        title: const Text('Patient Clinical Information'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Blood Pressure')),
            DataColumn(label: Text('Respiratory Rate')),
            DataColumn(label: Text('Blood Oxygen Level')),
            DataColumn(label: Text('Heart Rate')),
            DataColumn(label: Text('Critical Condition')),
          ],
          rows: patientClinicalData.map((patient) {
            return DataRow(
              cells: [
                DataCell(Text(patient['_id'].toString())),
                DataCell(Text(patient['date'])),
                DataCell(Text(patient['bloodPressure'])),
                DataCell(Text(patient['respiratoryRate'])),
                DataCell(Text(patient['bloodOxygenLevel'])),
                DataCell(Text(patient['heartbeatRate'])),
                DataCell(Text(patient['condition_critical'])),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
