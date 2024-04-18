// import 'package:cogniversity/Services/hyperlink/hyperlink_sevice.dart';
import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/auxilliary/materials.dart';
import 'package:cogniversity/views/teacher/inner/add_lesson.dart';
// import 'package:cogniversity/views/student/studentapp.dart';
import 'package:cogniversity/views/teacher/teacherapp.dart';
import 'package:cogniversity/widgets/elevated_buttons.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/my_action_button.dart';
import 'package:cogniversity/widgets/video_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.courseName});
  final String courseName;
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
   bool enrolled = false;
  
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
               decoration: const BoxDecoration( image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xhc3N8ZW58MHx8MHx8fDA%3D"))
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
                  Container(
                    
                    decoration: BoxDecoration(color: Colors.amberAccent, border: Border.all(style: BorderStyle.none) , borderRadius: BorderRadius.circular(12)),
                    child: 
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Icon(Icons.)
                          Text("0", style: TextStyle( fontSize: 23),),
                          MySpacer(height: 3,),
                          Text("Enrolled", style: TextStyle( fontSize: 13),),
                        ],
                      ),
                    ),
                  ),
                  // Cards( title: "Enrolled", icon: Icons.people,),
                  //Quiz
                  GestureDetector
                  (
                    onTap: () {
                      Navigator.of( context).pushReplacement(MaterialPageRoute(builder: ((context) => const TeacherApp(tab: 1))));
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
                
                    isEducator? const MyActionButton(page: AddLessonView(), icon: Icons.add, title: "Add Lesson"): Container(),
                
                   ],
                               ),
                ),
               const MySpacer(height: 7,),

              //  LessonList(index: index)

             (isEducator || enrolled == true) ? Padding(   //Using provider to handle state of lecturer
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 400,
                        // height: double.maxFinite,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: ((context, index) {
                              return LessonList(
                                index: index,
                              );
                            }))),
                  ): Container(
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),color: Colors.pink[100],),
                    height: 200,
                    child: const Center(
                      child: Text("Enroll to see Courses", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),),

                const MySpacer(height: 15,),

             !isEducator | enrolled  ? MyElevattedButton(
                      title: "Enroll",
                      color: Colors.black,
                      action: () {
                       setState(() {
                         enrolled = true;
                       });
                      }): Container()
                  
            ],
          ),
       ),
     ),
    );
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
