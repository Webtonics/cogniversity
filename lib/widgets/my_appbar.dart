import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.deepPurple
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             const Padding(
              padding: EdgeInsets.only(top: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fHww"),
                  ),  
                  SizedBox(width: 5,),
              
                  Text("Hi, Alan", style: TextStyle(color: Colors.white, fontSize: 18,),),
                ],
              ),
            ),
            
            IconButton(onPressed: (){
            
            }, icon: const Icon(Icons.notifications, color: Colors.white,))
            
          ],
        ),
      ),
    );
  }
}