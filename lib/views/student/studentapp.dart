// import 'package:cogniversity/views/home.dart';
import 'package:cogniversity/providers/user_provider.dart';
import 'package:cogniversity/views/student/courses.dart';
import 'package:cogniversity/views/student/home.dart';
import 'package:cogniversity/views/student/notifications.dart';
import 'package:cogniversity/views/student/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///first student view
class StudentApp extends StatefulWidget {
  const StudentApp({super.key});

  @override
  State<StudentApp> createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
  int current = 0;

  @override
  void initState() {
    super.initState();
    addUserProvider();
  }

  addUserProvider() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  List<Widget>views = const[
    StudentHome(),
    CoursesView(),
    Notificationview(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: views[current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        elevation: 2,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (value) {
          setState(() {
            current = value;
          });
        },
        ),
        
    );
  }
}