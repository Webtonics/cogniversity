import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogniversity/Services/firestoreservice/firestore_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser!.uid;

//////////Courses
  //get all courses
  Stream<QuerySnapshot<Map<String, dynamic>>> getallCourses() {
    Stream<QuerySnapshot<Map<String, dynamic>>> documentSnapshot =
        _firestore.collection('courses').snapshots();
    return documentSnapshot;
  }

  //add course
  Future<String>addCourse(String courseId,String title, String description,String instructor, String groupChat, String thumbnail) async{
     String res = "Succesful";
     await _firestore.collection('courses').doc().set(
      {
        "courseId":courseId,
        "title": title,
        "description": description,
        "instructor": instructor,
        "groupChat":groupChat,
        "thumbnail":thumbnail,
      }
     );

    return res;
  }
  //Delete Course
  Future<void>deleteCourse(String docpath)async{
      await _firestore.collection('course').doc(docpath).delete();
      //function to clear from storage
  }

//////////Lessons
  //add lesson
  Future<void>addLesson(String courseId,String title, String description, String videoUrl, String thumbnail)async{

    //to-do: add funtion to upload video: get download url

    await _firestore.collection("video").doc().set({
      'title': title,
      'description':description,
      'course':description,
      "creator": userId,
      "thumbnail": thumbnail,
      'videoUrl':videoUrl
    });
  }

//get lesson
Stream<QuerySnapshot<Map<String, dynamic>>> getLesson(String courseId) {
  // Use whereEqualTo instead of assignment (=) for field comparison
  return _firestore.collection('video')
      .where('creator', isEqualTo: courseId)
      .snapshots();
}

//Delete Lesson
Future<void>deleteLesson(String docpath)async{
  await _firestore.collection('video').doc(docpath).delete();
}

//////////Enrollment
//Enroll student
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

Stream<QuerySnapshot<Map<String,dynamic>>>getLessons(String courseId){
  Stream<QuerySnapshot<Map<String,dynamic>>> document = 
  _firestore.collection('video')
  .where('course', isEqualTo: courseId).snapshots();

  return document;
}

}