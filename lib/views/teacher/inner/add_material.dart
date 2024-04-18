import 'package:cogniversity/views/teacher/inner/add_course.dart';
import 'package:cogniversity/widgets/elevated_buttons.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AddMaterial extends StatefulWidget {
  const AddMaterial({super.key});

  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    _titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Add Material"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            MyTextField(controller: _titleController, label: "Title", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true, maxlines: 1,),
            const MySpacer(height: 5,),
            Column(
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
                  MySpacer(height: 10,),
                  MyElevattedButton(title: "Submit", action: (){
                    //Submit logic here
                  })
          ],
        ),
      )
      // Stepper(steps:steps ),
    );

    
  }
  // List<Step>steps = [
  //   Step(title: "Add", 
  //   content: Container(
  //     child: Column(
  //       children: [
  //         Text("")
  //       ],
  //     ),
  //   )
  //   )
  // ];
}