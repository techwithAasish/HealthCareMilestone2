import 'package:flutter/material.dart';

class ViewClinicalRecord extends StatelessWidget {
  // Replace this data with actual patient information
  final List<Map<String, dynamic>> patientData = [
    {
      'id': 1,
      'date': '3/10/2022',
      'blood_pressure': '90/60',
      'respiratory_rate': '70',
      'blood_oxygen_level': '95%',
      'heartbeat_rate': '60',
    },
    {
      'id': 2,
      'date': '3/10/2020',
      'blood_pressure': '96/65',
      'respiratory_rate': '90',
      'blood_oxygen_level': '100%',
      'heartbeat_rate': '80',
    },
    {
      'id': 3,
      'date': '3/10/2021',
      'blood_pressure': '99/50',
      'respiratory_rate': '80',
      'blood_oxygen_level': '88%',
      'heartbeat_rate': '70',
    },
    {
      'id': 4,
      'date': '3/10/2019',
      'blood_pressure': '91/61',
      'respiratory_rate': '77',
      'blood_oxygen_level': '101%',
      'heartbeat_rate': '66',
    },
    // Add more patient data as needed
  ];

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
          ],
          rows: patientData.map((patient) {
            return DataRow(
              cells: [
                DataCell(Text(patient['id'].toString())),
                DataCell(Text(patient['date'])),
                DataCell(Text(patient['blood_pressure'])),
                DataCell(Text(patient['respiratory_rate'])),
                DataCell(Text(patient['blood_oxygen_level'])),
                DataCell(Text(patient['heartbeat_rate'])),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
