import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milestone 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInHttpDemo(),
    );
  }
}

@JsonSerializable()
class FormData {
  String? email;
  String? password;

  FormData({
    this.email,
    this.password,
  });

  // factory FormData.fromJson(Map<String, dynamic> json) =>
  //     _$FormDataFromJson(json);

  // Map<String, dynamic> toJson() => _$FormDataToJson(this);
}

class SignInHttpDemo extends StatefulWidget {
  final http.Client? httpClient;

  const SignInHttpDemo({
    this.httpClient,
    super.key,
  });

  @override
  State<SignInHttpDemo> createState() => _SignInHttpDemoState();
}
