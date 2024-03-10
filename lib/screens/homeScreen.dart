import 'package:flutter/material.dart';
import 'package:milestone2/screens/addClinicalRecord.dart';
import 'package:milestone2/screens/addPatientRecord.dart';
import 'package:milestone2/screens/updatePatientRecord.dart';
import 'package:milestone2/screens/viewClinicalRecord.dart';
import 'package:milestone2/screens/viewPatientRecord.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Info App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/patientinfo.jpg', // Replace with your image asset
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientRecordScreen(),
                  ),
                );
              },
              child: const Text('Patient Info'),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'images/clinicalrecord.jpg', // Replace with your image asset
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClinicalDataScreen(),
                  ),
                );
              },
              child: const Text('Patient Clinical Info'),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientRecordScreen extends StatelessWidget {
  const PatientRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient Record'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPatientRecord()),
                );
              },
              child: const Text('Add Patient Record'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UpdatePatientRecord()),
                );
                // Add functionality to update patient record
              },
              child: const Text('Update Patient Record'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientInfoTableScreen()),
                );
              },
              child: const Text('View Patient Record'),
            ),
          ],
        ),
      ),
    );
  }
}

class ClinicalDataScreen extends StatelessWidget {
  const ClinicalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Clinical Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddClinicalRecord()),
                );
              },
              child: const Text('Add Patient Clinical Record'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to update patient record
              },
              child: const Text('Update Patient Clinical Record'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewClinicalRecord()),
                );
              },
              child: const Text('View Patient Clinical Record'),
            ),
          ],
        ),
      ),
    );
  }
}
