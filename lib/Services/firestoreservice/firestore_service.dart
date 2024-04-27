import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogniversity/Services/firestoreservice/firestore_exception.dart';
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
  // Check for existing enrollment
  final snapshot = await _firestore
      .collection('enrolledStudents')
      .where('userId', isEqualTo: userId)
      .where('courseId', isEqualTo: courseId)
      .get();

  if (snapshot.docs.isEmpty) {
    // No existing enrollment, add a new document
    await _firestore.collection('enrolledStudents').add({
      'userId': userId,
      'courseId': courseId,
    });
  } else {
    // Enrollment already exists, handle potential error or message
    throw AlreadyEnrolledException();// Or show user a message
  }
}
// Future<void> enrollStudent( String courseId) async {
//   await isEnrolled(userId, courseId);
//   // Add a document to the enrolledStudents collection
//   await _firestore.collection('enrolledStudents').add({
//     'userId': userId,
//     'courseId': courseId,
//   });
// }

//Checking enrollment status:
Future<bool> isEnrolled( String courseId) async {
  // Query the enrolledStudents collection
  final snapshot = await _firestore
      .collection('enrolledStudents')
      .where('userId', isEqualTo: userId)
      .where('courseId', isEqualTo: courseId)
      .get();

  // Check if any documents are found
  return snapshot.docs.isNotEmpty;
}


// Stream<int> getEnrolledUserCountStream(String courseId) {
//    Stream<int> count = _firestore
//       .collection('enrolledStudents')
//       .where('courseId', isEqualTo: courseId)
//       .snapshots()
//       .map((snapshot) => snapshot.docs.length); 
//     print(count);
//     return count;

// }
Stream<int> getEnrolledUsersCountStream(String courseId) {
  return _firestore
      .collection('enrolledStudents')
      .where('courseId', isEqualTo: courseId)
      .snapshots()
      .map((snapshot) {
        print("Emitted data: ${snapshot.docs.length}"); // Add this line
        return snapshot.docs.length;
      });
}

  void getEnrolledUserCountStream(String courseId) {}

}

