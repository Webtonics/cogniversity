import 'package:flutter/material.dart';

class LecturerCourseView extends StatefulWidget {
  const LecturerCourseView({super.key});

  @override
  State<LecturerCourseView> createState() => _LecturerCourseViewState();
}

class _LecturerCourseViewState extends State<LecturerCourseView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Course View"),
      ),
    );
  }
}