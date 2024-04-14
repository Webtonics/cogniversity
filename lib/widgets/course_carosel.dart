import 'package:cogniversity/views/student/coursedetails.dart';
import 'package:flutter/material.dart';

class CourseCarosel extends StatelessWidget {
  const CourseCarosel({
    super.key, required this.direction,
  });

  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: direction,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const CourseDetails()))),
            child: const CourseCardItem());
      })));
  }
}

class CourseCardItem extends StatelessWidget {
  const CourseCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        alignment: AlignmentDirectional.center,
        height: 200,
        width: 280,
        decoration: const BoxDecoration(
          color:  Color.fromARGB(255, 40, 15, 84),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          image: DecorationImage(opacity: 0.6,image: NetworkImage("https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xhc3N8ZW58MHx8MHx8fDA%3D"))),
        child: const Column(
          children: [
            Text("GSP 101- Use of English", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
            Text("GSP is about the Study of t....", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}