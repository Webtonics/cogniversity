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
    final bool islast = currentstep == getstep().length -1;
    // final bool isfirst = currentstep == getstep()[0];
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add a New Course"),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stepper(     
              currentStep: currentstep,      
              controller: scrollController,
              steps:getstep(),

              onStepContinue: () {
                
        
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
                    MyTextField(controller: textEditingController, label: "Title", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true, maxlines: 1,),
                    const MySpacer(height: 5,),
                    MyTextField(controller: textEditingController, label: "Brief Description", hinttext: "VTE 101", keyboardtype: TextInputType.text, enabled: true, maxlines: 5,),
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
              const Step(title: Text("Finishing Videos"), content: Column(
                children: [
                  Text("Basic")
                ],
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