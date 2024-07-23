import 'package:department_store_assignment/app_dependency_injection.dart';
import 'package:department_store_assignment/presentation/department_store_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppDependencyInjection().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DepartmentStorePage());
  }
}
