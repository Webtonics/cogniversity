import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cogniversity/models/courses.dart';
// import 'package:cogniversity/views/student/courses.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser!.uid;

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

//get video
Stream<QuerySnapshot<Map<String, dynamic>>> getVideo(String courseId) {
  // Use whereEqualTo instead of assignment (=) for field comparison
  return _firestore.collection('video')
      .where('creator', isEqualTo: courseId)
      .snapshots();
}

//Enroll student
// Future<void>enrollStudent(String userId, String courseId)async{
//   await _firestore.collection('courses').doc(courseId).update(
//     {
//       "studentEnrolled": userId,
//     }
//   );
// }
Future<void> enrollStudent( String courseId) async {
  // Add a document to the enrolledStudents collection
  await _firestore.collection('enrolledStudents').add({
    'userId': userId,
    'courseId': courseId,
  });
}

//Checking enrollment status:
Future<bool> isEnrolled(String userId, String courseId) async {
  // Query the enrolledStudents collection
  final snapshot = await _firestore
      .collection('enrolledStudents')
      .where('userId', isEqualTo: userId)
      .where('courseId', isEqualTo: courseId)
      .get();

  // Check if any documents are found
  return snapshot.docs.isNotEmpty;
}

Future<int> getEnrolledUserCount(String courseId) async {
  final snapshot = await _firestore
      .collection('enrolledStudents')
      .where('courseId', isEqualTo: courseId)
      .get();

  return snapshot.docs.length;
}


}

