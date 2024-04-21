import 'package:cogniversity/providers/role_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isEducator = context.watch<RoleProvider>().isEducator;
     if (isEducator) {
       return Card(
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: const CircleAvatar( backgroundColor: Colors.deepOrange,),
          trailing:  IconButton(onPressed: (){
            
          }, icon: const Icon(Icons.edit_square)),
          // trailing:  isEducator? IconButton(onPressed: (){
            
          // }, icon: const Icon(Icons.edit_square)) :  Container(),
          title: const Text("Gsp 101 essay"),
        ),
      )
    );
     }else{
      return const Card(
      child:Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar( backgroundColor: Colors.deepOrange,),
          title: Text("Gsp 101 essay"),
        ),
      )
    );
     }
  }
}