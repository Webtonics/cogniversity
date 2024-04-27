import 'package:cloud_firestore/cloud_firestore.dart';
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
  
  getCourses(){
    // await FirestoreService().getallCoursesn();
    FirestoreService().getallCourses();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreService().getallCourses(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          
          if (snapshot.hasData) {

            return SizedBox(
            height: 200,
            child: ListView.builder(
              
              itemCount: snapshot.data!.docs.length,
              scrollDirection: widget.direction,
              itemBuilder: ((context, index) {
                final String  id = snapshot.data!.docs[index].id ;
                final String  title = snapshot.data!.docs[index].data()['title'] ;
                final String  description = snapshot.data!.docs[index].data()['description'] ;
                final String  thumbnail = snapshot.data!.docs[index].data()['thumbnail'] ;
                return GestureDetector(
                  onTap: () { 
                    // getCourses();
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>   CourseDetails(courseName: title, thumbnail: thumbnail, courseId: id,))));
              },
              child:  CourseCardItem(title:title , description:description, imageUrl: thumbnail,));
          })));
          
          }
          else if (snapshot.hasError) {
            print(snapshot.error);
            return Container(child:  Text(snapshot.error.toString()),);
          }else{
            // return const CircularProgressIndicator();
            return Container(child:  const Text("No data"));
          }
        }else{
          return Padding(
            padding: const EdgeInsets.all(8.0),

            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.pink[100]
              ),
              child: const Center( child: CircularProgressIndicator(),)),
          );
          
        }
      }
    );
  }
}

class CourseCardItem extends StatelessWidget {
  final String description;
  
  final String title;
  final String imageUrl;

  const CourseCardItem({
    super.key, required this.description, required this.title, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        height: 200,
        width: 280,
        decoration:  BoxDecoration(
          color:  const Color.fromARGB(255, 40, 15, 84),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          image: DecorationImage(fit: BoxFit.cover, opacity: 0.6,image: NetworkImage(imageUrl))),
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