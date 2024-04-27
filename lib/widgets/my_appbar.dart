import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    super.key, required this.displayName, required this.photoURL,
  });

  final String displayName;
  final String photoURL;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
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
              Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   CircleAvatar(
                    
                    backgroundImage: NetworkImage(widget.photoURL),
                  ),  
                  const SizedBox(width: 5,),
              
                  Text("Hi, ${widget.displayName}", style: const TextStyle(color: Colors.white, fontSize: 18,),),
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