import 'dart:math';

import 'package:cogniversity/Services/firestoreservice/firestore_service.dart';
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
   TextEditingController _titleController = TextEditingController();
   TextEditingController _descriptionController = TextEditingController();
   

  @override
  void initState() {
    scrollController= ScrollController();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  addCourse()async{
    await FirestoreService().addCourse("${Random(40)}", _titleController.text, _descriptionController.text, "${Random(40)}");
  }

  @override
  Widget build(BuildContext context) {
    final bool islast = currentstep == getstep().length -1;
    // final bool isfirst = currentstep == getstep()[0];
    
    return  Scaffold(
      endDrawer: Drawer(),
      appBar: AppBar(
        title: const Text("Add a New Course"),
        
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stepper(  
              
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom( backgroundColor: Colors.deepPurple, shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)) ),
                      onPressed: details.onStepContinue,
                      child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 12),),
                    ),
                    const MySpacer( width: 5,),
                    if (currentstep > 0) // Only show back button if not on the first step
                      ElevatedButton(
                        style: ElevatedButton.styleFrom( backgroundColor: Colors.deepOrange, shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)) ),
                        onPressed: details.onStepCancel,
                        child: const Text('Back',style: TextStyle(color: Colors.white, fontSize: 12),),
                      ),
                  ],
                );
              },
              currentStep: currentstep,      
              controller: scrollController,
              steps:getstep(),

              onStepContinue: () {
                
        
                if (islast) {
                 addCourse();
                 const SnackBar(content: Text("Couse added successfully"));
                  //Show congrats

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CongratulationView()));
                }else{
                  setState(() {
                    currentstep++;
                  });
                }
                
              },
              onStepCancel: () {
               if (currentstep <= 0) {
                 scrollController.jumpTo(1);
               }else{
                setState(() {
                  currentstep--;
               });
               }
              },
              // onStepTapped: (value) {
                
              // },
              )
          ],
        ),
      ),


    );

    
  }
  List<Step>getstep(){
    return [
      Step(title: const Text("Basic details"), content: SizedBox(
        height: 540,
        child: Column(
                  children: [
                    const Text("Basic"),
                    MyTextField(controller: _titleController, label: "Title", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true, maxlines: 1,),
                    const MySpacer(height: 5,),
                    MyTextField(controller: _descriptionController, label: "Brief Description", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true, maxlines: 5,),
                    const MySpacer(height: 5,),
                    const Text("Add Cover Image   (Optional)"),
                    Container(
                      alignment: Alignment.center,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all( style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(19)
                      ),
                      child: const Center(
                        child: Icon(Icons.upload),
                      ),
                    )
                  ],
                ),
      )),
               Step(title: const Text("Course material"), content: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    const Text("Upload Lecture materials  (Optional)"),
                
                    Container(
                      alignment: Alignment.center,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all( style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(19)
                      ),
                      child: const Center(
                        child: Icon(Icons.upload),
                      ),
                    ),
                    
                    const MySpacer(height: 9,),
                    //list of uploaded materials
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const[
                          //power point
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: UploadedMaterial( title:"Lecturenote.PPt", color: Colors.deepOrange,),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: UploadedMaterial( title:"Lecturenote.pdf", color: Colors.deepPurple,),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: UploadedMaterial( title:"Lecturenote.doc", color: Colors.deepOrange,),
                          ),
                        ],
                        
                      ),
                    )
                  ],
                ),
              )),
              const Step(title: Text("Add Lesson"), content: SizedBox(
                child: Column(
                  children: [
                    Text("Basic")
                  ],
                ),
              )),
               
    ];
  }
}

class UploadedMaterial extends StatelessWidget {
  const UploadedMaterial({
    super.key, required this.title, required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Container(
                          
      child: Column(
        
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: color, border: Border.all(style: BorderStyle.solid)),
            

          ),
          Text(title)
        ],
      ),
                          
    );
  }
}