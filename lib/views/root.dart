import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/student/studentapp.dart';
import 'package:cogniversity/views/teacher/teacherapp.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child:Scaffold(
        backgroundColor: Colors.amber,
        body:  Padding(
          
          padding: smallwidth > 300? const EdgeInsets.all(0):const EdgeInsets.all(10.0),
          // ignore: sized_box_for_whitespace
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 200),
            child: Column(
              children: [
                const Text("Choose an Account Type", style:TextStyle( fontSize: 28, fontWeight: FontWeight.bold)),
                const MySpacer(height: 12,),
                Container(
                  alignment: Alignment.center,
                  color:Colors.white,
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
                              //provider State management
                              context.read<RoleProvider>().setRoleAsEducator();
          
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
          
                              //provider State management
                              context.read<RoleProvider>().setRoleAsLearner();
          
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
              ],
            ),
          ),
        ),
      )
    );
  }
}


