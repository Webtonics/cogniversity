import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cogniversity/models/courses.dart';
// import 'package:cogniversity/views/student/courses.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get all courses
  Stream<QuerySnapshot<Map<String, dynamic>>> getallCourses() {
    Stream<QuerySnapshot<Map<String, dynamic>>> documentSnapshot =
        _firestore.collection('courses').snapshots();
    return documentSnapshot;
  }

  //add course
  Future<String>addCourse(String courseId,String title, String description,String instructor) async{
     String res = "Succesful";
     await _firestore.collection('course').doc().set(
      {
        "courseId":courseId,
        "title": title,
        "description": description,
        "instructor": instructor,
      }
     );

    return res;
  }


  //get courses (Stream)
// Stream<QuerySnapshot<Map<String, dynamic>>> getCourses(){

// }

//get courses
Stream<QuerySnapshot<Map<String,dynamic>>>getallCoursesn() {
  String res = "Success";
 
  Stream<QuerySnapshot<Map<String,dynamic>>> documentSnapshot =  _firestore.collection('course').snapshots();

  return documentSnapshot;
}
}

