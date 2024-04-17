import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: const CircleAvatar( backgroundColor: Colors.deepOrange,),
          trailing: IconButton(onPressed: (){
        
          }, icon: const Icon(Icons.edit_square)),
          title: const Text("Gsp 101 essay"),
        ),
      ),
    );
  }
}