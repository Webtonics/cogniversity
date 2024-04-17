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

