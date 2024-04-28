import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/student/course_lesson.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonList extends StatelessWidget {
  final String description;
  
  final String title;
  final Map<String,dynamic>map;

  
  const LessonList({
    super.key,
    required this.index, required this.description, required this.title, required this.map,
  });
  final int index;

  

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
          
            const CourseLesson()
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
              leading: 
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(map['thumbnail']),
              ),
              // const Icon(
              //   Icons.play_circle,
              //   size: 40,
              // ),
              title: Text(map['title'], maxLines: 1,),
              subtitle: Text(description,maxLines: 1,),
              trailing: isEducator ? IconButton(onPressed: (){
                // action to Delete 
              }, icon: const Icon(Icons.delete),): const Text("")
            ),),
      ),
    );
  }
}
