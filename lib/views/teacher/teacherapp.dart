// import 'package:cogniversity/views/teacher/courses.dart';
import 'package:cogniversity/views/teacher/home.dart';
import 'package:cogniversity/views/teacher/profile.dart';
import 'package:cogniversity/views/teacher/quiz.dart';
import 'package:flutter/material.dart';

class TeacherApp extends StatefulWidget {
  const TeacherApp({super.key});

  @override
  State<TeacherApp> createState() => _TeacherAppState();
}

class _TeacherAppState extends State<TeacherApp> {

  int currentTab = 0;

  List<Widget> views = const[
    LecturerDashboard(),  LecturerQuiz(), LecturerProfile()
  ];

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      // backgroundColor: Color.fromARGB(255, 40, 15, 84),
      
      body: views[currentTab],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: currentTab,
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          // BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Quiz"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),

      ]),
    );
  }
}