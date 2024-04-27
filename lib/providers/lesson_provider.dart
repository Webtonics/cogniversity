import 'package:cogniversity/Services/firestoreservice/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> _lessons = [];

  // Getter for lessons
  List<QueryDocumentSnapshot<Map<String, dynamic>>> get lessons => _lessons;

  // Function to fetch lessons using FirestoreService
  void fetchLessons(String courseId) {
  FirestoreService().getLessons(courseId).listen((snapshot) {
    _lessons = snapshot.docs.toList();
    notifyListeners();
  });
}
}