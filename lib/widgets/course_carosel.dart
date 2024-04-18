import 'package:cogniversity/Services/firestoreservice/firestore_service.dart';
import 'package:cogniversity/views/student/coursedetails.dart';
import 'package:flutter/material.dart';

class CourseCarosel extends StatefulWidget {
  const CourseCarosel({
    super.key, required this.direction,
  });

  final Axis direction;

  @override
  State<CourseCarosel> createState() => _CourseCaroselState();
}

class _CourseCaroselState extends State<CourseCarosel> {
  @override
  void initState() {
    super.initState();
    getCourses();
  }
  
  getCourses()async{
    await FirestoreService().getallCoursesn();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: widget.direction,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () { 
              // getCourses();
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>  const CourseDetails(courseName: ' GSP 101- Use of English',))));
        },
        child: const CourseCardItem(title:"VTE 101" , description:"Wowwoowwo" ,));
      })));
  }
}

class CourseCardItem extends StatelessWidget {
  final String description;
  
  final String title;

  const CourseCardItem({
    super.key, required this.description, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        height: 200,
        width: 280,
        decoration: const BoxDecoration(
          color:  Color.fromARGB(255, 40, 15, 84),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          image: DecorationImage(fit: BoxFit.cover, opacity: 0.6,image: NetworkImage("https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xhc3N8ZW58MHx8MHx8fDA%3D"))),
        child:  Column(
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
            Text(description,maxLines: 1, style: const TextStyle(color: Colors.white), softWrap: true,)
          ],
        ),
      ),
    );
  }
}