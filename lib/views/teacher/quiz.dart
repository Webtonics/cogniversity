import 'package:cogniversity/views/teacher/inner/add_quiz.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/quizcard.dart';
import 'package:flutter/material.dart';

class LecturerQuiz extends StatefulWidget {
  const LecturerQuiz({super.key});

  @override
  State<LecturerQuiz> createState() => _LecturerQuizState();
}

class _LecturerQuizState extends State<LecturerQuiz> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
               const Center(
                child: Text("Quiz"),
                
              ),
              const MySpacer(height: 7,),
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddQuiz(editing: false)));
                }, icon: const Icon(Icons.add), label: const Text("Add Quiz"))
              ),
              const MySpacer(height: 7,),
              Expanded(
                child: ListView.builder( 
                  itemCount: 6,
                  itemBuilder: (context, index){
                    return const QuizCard();
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}

