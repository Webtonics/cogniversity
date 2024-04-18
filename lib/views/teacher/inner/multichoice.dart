import 'package:cogniversity/widgets/elevated_buttons.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:flutter/material.dart';

class MultichoiceQuiz extends StatefulWidget {
  const MultichoiceQuiz({super.key});

  @override
  State<MultichoiceQuiz> createState() => _MultichoiceQuizState();
}

class _MultichoiceQuizState extends State<MultichoiceQuiz> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add Quiz"),
      ),
      body:   Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //Question
           const Expanded(child: TextField(decoration: InputDecoration( border: OutlineInputBorder(),label: Text("Question"), helperText: "What is the first city to be freed"), maxLines: 6,)),
           //Textbox
           
           const MySpacer(height: 7,),
           MyElevattedButton(title: "Submit", action: (){
              //
            
           })
            //Button
          ],
        ),
      ),
    );
  }
}