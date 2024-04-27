import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/student/course_lesson.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonList extends StatelessWidget {
  
  const LessonList({
    super.key,
    required this.index,
  });
  final int index;

  // getref(){
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   Reference videoRef = storage.ref().child('gs://skilloom.appspot.com/CourseLessons/username/● teacherapp.dart - cogniversity - Visual Studio Code 2024-04-14 11-54-00.mp4');
  //   return videoRef;

  // }

  getVideo(){

    //function to get the video snapshot
  }

  @override
  Widget build(BuildContext context) {
    bool isEducator = context.watch<RoleProvider>().isEducator;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => 
          
            CourseLesson(videoSnap: getVideo(),)
          //  VideoPlayerWidget(videoRef: getref())
           )),
        ),
        child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              // border: Bo,
              borderRadius: BorderRadius.all(Radius.circular(21)),
              border: Border.symmetric(
                  vertical: BorderSide(
                    color: Colors.black,
                  ),
                  horizontal: BorderSide(color: Colors.black)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.play_circle,
                size: 40,
              ),
              title: Text("Title $index", maxLines: 1,),
              subtitle: Text("This is the description of $index",maxLines: 1,),
              trailing: isEducator ? IconButton(onPressed: (){
                // action to Delete 
              }, icon: const Icon(Icons.delete),): const Text("")
            ),),
      ),
    );
  }
}
