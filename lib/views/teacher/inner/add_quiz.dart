import 'package:cogniversity/views/teacher/inner/essay_quiz.dart';
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
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
          children: [
       
            TextField(decoration: InputDecoration( border: OutlineInputBorder(),label: Text("Title"), helperText: "What is the first city to be freed"),),
            TextField(decoration: InputDecoration( border: OutlineInputBorder(),label: Text("Description  (Optional)"), helperText: "What is the first city to be freed"), maxLines: 6,),
            const Text("Type"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const EssayQuiz())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
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
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MultichoiceQuiz())),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical:10 ) ,
                      child: const Column(
                        children: [
                          Icon(Icons.document_scanner_outlined),
                          MySpacer(height: 7,),
                          Text("Multichoice"),
                        ],
                      ),
                    ),
                    ),
                  ),
                )
              ],
            )
            
          ],
             ),
       ),
    );
  }
}