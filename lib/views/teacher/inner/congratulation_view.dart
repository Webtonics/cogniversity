import 'package:cogniversity/views/teacher/teacherapp.dart';
import 'package:cogniversity/widgets/elevated_buttons.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:flutter/material.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              //Lottie image
              const CircleAvatar(
                radius: 69,
                backgroundColor: Colors.deepOrange,
              ),
              //Text
              const Center(child: Text("Congratulations your course has been add", textAlign: TextAlign.center,style: TextStyle( fontSize: 27, fontWeight: FontWeight.bold),)),
              const MySpacer(
                height: 8,
              ),
      
              MyElevattedButton(title: "Make changes", action: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const TeacherApp() ));
              }),

              const MySpacer(
                height: 8,
              ),
              MyElevattedButton(title: "Start Adding quiz", action: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const TeacherApp() ));
              }),

              const MySpacer(
                height: 8,
              ),
              MyElevattedButton(title: "Continue to Dashboard", action: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const TeacherApp() ));
              }),

              //button to view the course (Future)
            ],
          ),
        ),
      ),
    );
  }
}