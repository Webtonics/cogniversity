import 'package:cogniversity/views/teacher/inner/multichoice.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:flutter/material.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key, required this.editing});
   
   final bool editing;
  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: widget.editing? const Text("Edit Quiz"): const Text("Add New Quiz"),
      ),
      body: 
       Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const EssayQuiz())));
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                  child: Container(
                    padding:const EdgeInsets.all(40) ,
                    child: const Column(
                      children: [
                        Icon(Icons.document_scanner_outlined),
                        MySpacer(height: 7,),
                        Text("Essay"),
                      ],
                    ),
                  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                child: Container(
                  padding:const EdgeInsets.all(40) ,
                  child: const Column(
                    children: [
                      Icon(Icons.document_scanner_outlined),
                      MySpacer(height: 7,),
                      Text("Multichoice"),
                    ],
                  ),
                ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}