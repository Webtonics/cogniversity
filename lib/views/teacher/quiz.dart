import 'package:flutter/material.dart';

class LecturerQuiz extends StatefulWidget {
  const LecturerQuiz({super.key});

  @override
  State<LecturerQuiz> createState() => _LecturerQuizState();
}

class _LecturerQuizState extends State<LecturerQuiz> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Quiz"),
      ),
    );
  }
}