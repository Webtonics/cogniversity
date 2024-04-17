import 'package:cogniversity/views/student/studentapp.dart';
import 'package:cogniversity/views/teacher/teacherapp.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  @override
  void initState() {
    // Provider.of<Role>(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // var role = Provider.of<Role>(context).role;
    // print(role);
    final smallwidth = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Padding(
    
          padding: smallwidth > 300? const EdgeInsets.all(0):const EdgeInsets.all(10.0),
          // ignore: sized_box_for_whitespace
          child: Container(
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //View Educator UI
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const TeacherApp(tab: 0,))));
                      },icon: const Icon(Icons.person_2),label:const Text("Educator"), style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14),),
                      minimumSize:  const Size(100, 60)
                      ),
                      ),
                    ),
                  ),
          
          
                  //View Student UI
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const StudentApp())));
                      },icon: const Icon(Icons.people_rounded),label:const Text("Student"),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14),),
                      minimumSize:  const Size(250, 60)
                      ),
                      ),
                    ),
                  ),
          
                ],
              ),
            ),
          ),
        ),
    );
  }
}


