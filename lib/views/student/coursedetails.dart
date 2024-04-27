// import 'package:cogniversity/Services/hyperlink/hyperlink_sevice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogniversity/Services/firestoreservice/firestore_exception.dart';
import 'package:cogniversity/Services/firestoreservice/firestore_service.dart';
import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/auxilliary/materials.dart';
import 'package:cogniversity/views/student/studentapp.dart';
import 'package:cogniversity/views/teacher/inner/add_lesson.dart';
// import 'package:cogniversity/views/student/studentapp.dart';
import 'package:cogniversity/views/teacher/teacherapp.dart';
import 'package:cogniversity/widgets/elevated_buttons.dart';
import 'package:cogniversity/widgets/error_dialog.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/my_action_button.dart';
import 'package:cogniversity/widgets/video_card_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.courseName, required this.thumbnail, required this.courseId});
  final String courseName;
  final String thumbnail;
  final String courseId;
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  //  bool enrolled = false;

   enrollUser(){
    try {
      return FirestoreService().enrollStudent( widget.courseId);
    } on AlreadyEnrolledException{
       showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Already Enrolled",
              content: "You Have Already Enrolled",
            );
          });
    }
   }
  
    isEnrolled(){
    return FirestoreService().isEnrolled(widget.courseId);
    }

    getEnrolledUsersCount(){
      FirestoreService().getEnrolledUsersCountStream(widget.courseId);
    }

    getLessons(){
      FirestoreService().getLessons(widget.courseId);
    }

  @override
  Widget build(BuildContext context) {

    bool isEducator = context.watch<RoleProvider>().isEducator;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: isEducator ? const Text("Educator"): const Text("learner"),
      ),
    body: 
     SafeArea(
       child: SingleChildScrollView(

         child: Column(
            children: [
              //Section 1: Hero
               Container(
                alignment: Alignment.bottomCenter,
               height: 300,
               width: double.infinity,
               decoration:  BoxDecoration( image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(widget.thumbnail))
               ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end ,
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(widget.courseName, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
              
                 ],),
               ),
               const MySpacer(height: 12,),
              

              //Section 2: Cards
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //materials
                  GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MaterialsView())),child: const Cards( title: "Materials", icon: Icons.notes,)),
                  //Enrolled
                  // Container(
                    
                  //   decoration: BoxDecoration(color: Colors.amberAccent, border: Border.all(style: BorderStyle.none) , borderRadius: BorderRadius.circular(12)),
                  //   child: 
                  //    Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       children: [
                  //         // Icon(Icons.)
                  //         StreamBuilder(
                  //           stream: getEnrolledUsersCount(),
                  //           builder: (context, snapshot) {
                  //            if (snapshot.connectionState == ConnectionState.active) {
                  //              if (snapshot.hasData) {
                  //             final count = snapshot.data!;
                  //               return  Text(count.toString(), style: const TextStyle( fontSize: 23),);
                  //            }else{
                  //                return const Text("0", style: TextStyle( fontSize: 23),);
                  //            }
                  //            }else{
                  //             return Text("00");
                  //            }
                  //           }
                  //         ),
                  //         const MySpacer(height: 3,),
                  //         const Text("Enrolled", style: TextStyle( fontSize: 13),),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Cards( title: "Enrolled", icon: Icons.people,),
                  //Quiz
                  isEducator? GestureDetector
                  (
                    onTap: () {
                      Navigator.of( context).pushReplacement(MaterialPageRoute(builder: ((context) => const TeacherApp(tab: 1))));
                    },
                    child: const Cards( title: "Quiz", icon: Icons.quiz_rounded,)):
                    GestureDetector
                  (
                    onTap: () {
                      Navigator.of( context).pushReplacement(MaterialPageRoute(builder: ((context) => const StudentApp())));
                    },
                    child: const Cards( title: "Quiz", icon: Icons.quiz_rounded,)),
                  //share code
                  const Cards( title: "Share", icon: Icons.share,),
                ],

                //lessons
                // card
               ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text(
                      "Lessons",style:  TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                     ),
                
                    isEducator? const MyActionButton(page: AddLessonView(), icon: Icons.add, title: "Add Lesson")
                    :ElevatedButton.icon(onPressed: (){

                      //Action to download

                    }, icon: const Icon(Icons.download), label: const Text("Download")),
                
                   ],
                               ),
                ),
               const MySpacer(height: 7,),

              //  LessonList(index: index)

              FutureBuilder(future: isEnrolled(), 
              builder: ((context, snapshot) {
                
                if (snapshot.hasData) {
                  final isUserEnrolled = snapshot.data!;

                   return (isEducator || isUserEnrolled == true) ? Padding(   //Using provider to handle state of lecturer
                    padding: const EdgeInsets.all(8.0),
                    child: CourseLessonList(widget: widget),

                  ): Container(
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),color: Colors.pink[100],),
                    height: 200,
                    child: const Center(
                      child: Text("Enroll to see Courses", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),);                
                    
                }else{
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      child: const CircularProgressIndicator()),
                  );
                }
              }),
              ),
              const MySpacer(height: 15,),
                
              // Visibility(
              //   visible: ,
              //   child: 
              //     
              //   )

            FutureBuilder<bool>(
            future: isEnrolled(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final isUserEnrolled = snapshot.data!;
                return Visibility(
                  visible: !isUserEnrolled, // Hide if enrolled
                  child: MyElevattedButton(
                      title: "Enroll",
                      color: Colors.black,
                      action: () {
                        enrollUser();
                      //  setState(() {
                      //    enrolled = true;
                       })
                );
              } else {
                return const CircularProgressIndicator(); // Show loading indicator
              }
            },
          )

            //  (isEducator || isEnrolled() == true) ? Padding(   //Using provider to handle state of lecturer
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //             height: 400,
            //             // height: double.maxFinite,
            //             child: ListView.builder(
            //                 itemCount: 10,
            //                 itemBuilder: ((context, index) {
            //                   return LessonList(
            //                     index: index,
            //                   );
            //                 }))),
            //       ): Container(
            //         decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),color: Colors.pink[100],),
            //         height: 200,
            //         child: const Center(
            //           child: Text("Enroll to see Courses", style: TextStyle(fontWeight: FontWeight.bold),),
            //         ),),

            //     const MySpacer(height: 15,),

            //  !isEducator | isEnrolled() ==  ? MyElevattedButton(
            //           title: "Enroll",
            //           color: Colors.black,
            //           action: () {
            //             enrollUser();
            //           //  setState(() {
            //           //    enrolled = true;
            //           //  });

            //           }): Container()
                  
            ],
          ),
       ),
     ),
    );
  }
}

class CourseLessonList extends StatefulWidget {
  const CourseLessonList({
    super.key,
    required this.widget,
  });

  final CourseDetails widget;

  @override
  State<CourseLessonList> createState() => _CourseLessonListState();
}

class _CourseLessonListState extends State<CourseLessonList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        // height: double.maxFinite,
        child: StreamBuilder(
          stream:FirestoreService().getLessons(widget.widget.courseId),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
            // if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
              final snap = snapshot.data!;
              
              return ListView.builder(
                itemCount: snap.docs.length,
                itemBuilder: ((context, index) {
                  final title = snap.docs[index].data()['title'];
                  final description = snap.docs[index].data()['description'];
                  return LessonList(
                    index: index, title: title, description: description,
                  );
                }));
              }

              else if(!snapshot.hasData){
                return Container( 
                  decoration: BoxDecoration( color: Colors.pink[200]),
                  height: 300,
                  width: double.infinity,
                  child: const Center(child: Text("No Lesson Videos Available")),);
              }
              else{
              return const Center(child: CircularProgressIndicator(),);
            }
            // }else{
            //   const Center( child: Text("Waiting"),);
            // }
            
            // return const Center( child: Text("Waiting Last"),);
          }
        ));
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key, required this.title, required this.icon,
  });
    final String title;
    final IconData icon;
  @override
  Widget build(BuildContext context) {
    
    return  Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3), ), 
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
             icon
            ),
            const MySpacer( height: 3,),
            Text(title)
      
          ],
        ),
      ),
    );
  }
}


// class CourseDetails extends StatefulWidget {
//   const CourseDetails({super.key, required this.courseName, });

//   final String courseName;
//   // final snap;

//   @override
//   State<CourseDetails> createState() => _CourseDetailsState();
// }

// class _CourseDetailsState extends State<CourseDetails> {

//   bool enrolled = false;

//   //function to handle enroll task 
//   // bool enroll(){
//   //   return true;
//   // }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text(widget.snap['title']),
//         title: const Text("Course Details"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//                 height: 250,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage("url")


//                       // image: NetworkImage("${widget.snap['thumbnail']}")                         ///to be updated
//                       ),
//                 ),
//               ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
                  
//                   const MySpacer(height: 7,),
//                   Center(
//                     child: Text(
//                       "${widget.courseName} information",
//                       style: const TextStyle(
//                           fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const MySpacer(height: 7,),
//                   // Center(
//                   //   child: Text("${widget.snap['description']} "),
//                   // ),
//                   const MySpacer(height: 7,),
                  
//                   enrolled == false ? MyElevattedButton(
//                       title: "Enroll",
//                       color: Colors.black,
//                       action: () {
//                        setState(() {
//                          enrolled = true;
//                        });
//                       })
//                   :MyElevattedButton(
//                       title: "Full Note",
//                       action: () {
//                         // LinkService()
//                         //     .launchURL(widget.snap['fullNote'], context);
//                       }),
//                   const MySpacer(height: 7,),
//                    Text(
//                     "All Lessons",
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                   const MySpacer(height: 7,),
//                   enrolled == true? Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         height: 400,
//                         // height: double.maxFinite,
//                         child: ListView.builder(
//                             itemCount: 10,
//                             itemBuilder: ((context, index) {
//                               return LessonList(
//                                 index: index,
//                               );
//                             }))),
//                   ): Container(
//                     decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),color: Colors.pink[100],),
//                     height: 200,
//                     child: const Center(
//                       child: Text("Enroll to see Courses", style: TextStyle(fontWeight: FontWeight.bold),),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // LinkService().launchURL(widget.snap['groupChat'], context);
//         },
//         child: const Icon(Icons.chat),
//       ),
//     );
//   }
// }

// // class VisdeoList extends StatelessWidget {
// //   const VisdeoList({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //         itemCount: 7,
// //         itemBuilder: ((context, index) {
// //           return const LessonList();
// //         }));
// //   }
// // }
