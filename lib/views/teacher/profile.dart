import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/student/studentapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LecturerProfile extends StatefulWidget {
  const LecturerProfile({super.key});

  @override
  State<LecturerProfile> createState() => _LecturerProfileState();
}

class _LecturerProfileState extends State<LecturerProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text("Profile"),
            ),
            ElevatedButton(onPressed: (){
              context.read<RoleProvider>().setRoleAsLearner();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const StudentApp() )));
            }, child: const Text("Login as Student"))
          ],
        ),
      ),
    );
  }
}