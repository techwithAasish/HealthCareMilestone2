import 'package:flutter/material.dart';

class PatientInfoTableScreen extends StatelessWidget {
  // Replace this data with actual patient information
  final List<Map<String, dynamic>> patientData = [
    {
      'id': 1,
      'first_name': 'John',
      'last_name': 'Doe',
      'dob': '13/09/2000',
      'gender': 'Male',
      'phone_number': '4371234545',
      'email_address': 'doe@gmail.com',
      'address': '45 Progress AVe'
    },
    {
      'id': 2,
      'first_name': 'Abhishek',
      'last_name': 'Rijal',
      'dob': '13/09/1996',
      'gender': 'Male',
      'phone_number': '4371234512',
      'email_address': 'abhishek@gmail.com',
      'address': '45 Kennedy road'
    },
    {
      'id': 1,
      'first_name': 'Anjali',
      'last_name': 'Thapa',
      'dob': '13/09/2001',
      'gender': 'Female',
      'phone_number': '4371234544',
      'email_address': 'anajli@gmail.com',
      'address': '45 Scarborough'
    },
    {
      'id': 3,
      'first_name': 'Aasish',
      'last_name': 'Mahato',
      'dob': '13/09/1999',
      'gender': 'Male',
      'phone_number': '4371234534',
      'email_address': 'aasi@gmail.com',
      'address': '1002 Progress AVe'
    },
    // Add more patient data as needed
  ];

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
                DataCell(Text(patient['id'].toString())),
                DataCell(Text(patient['first_name'])),
                DataCell(Text(patient['last_name'])),
                DataCell(Text(patient['dob'])),
                DataCell(Text(patient['gender'])),
                DataCell(Text(patient['phone_number'])),
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
