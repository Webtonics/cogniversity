import 'package:cogniversity/views/teacher/inner/congratulation_view.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({super.key});

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  int currentstep = 0;
   ScrollController scrollController = ScrollController();
   TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    scrollController= ScrollController();
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add a New Course"),
      ),
      body:  Column(
        children: [
          Stepper(     
            currentStep: currentstep,      
            controller: scrollController,
            steps:getstep(),

            onStepContinue: () {
              final bool islast = currentstep == getstep().length -1;
              if (islast) {
                //Show congrats
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CongratulationView()));
              }else{
                setState(() {
                  currentstep++;
                });
              }
              
            },
            onStepCancel: () {
             setState(() {
                currentstep--;
             });
            },
            // onStepTapped: (value) {
              
            // },
            )
        ],
      ),


    );

    
  }
  List<Step>getstep(){
    return [
      Step(title: const Text("Basic details"), content: Column(
                children: [
                  const Text("Basic"),
                  MyTextField(controller: textEditingController, label: "Title", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true),
                  MySpacer(height: 4,),
                  MyTextField(controller: textEditingController, label: "Title", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true),
                  MySpacer(height: 4,),
                  MyTextField(controller: textEditingController, label: "Title", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true),

                ],
              )),
              const Step(title: Text("Course material"), content: Column(
                children: [
                  Text("Basic")
                ],
              )),
              const Step(title: Text("Finishing Videos"), content: Column(
                children: [
                  Text("Basic")
                ],
              )),
    ];
  }
}