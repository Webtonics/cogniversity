import 'package:cogniversity/views/teacher/teacherapp.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Center(child: Text("Profile View"),),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const TeacherApp() )));
          }, child: const Text("Start Teaching"))
        ],
      ),
    );
  }
}