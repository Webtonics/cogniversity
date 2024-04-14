// import 'package:cogniversity/Services/hyperlink/hyperlink_sevice.dart';
import 'package:cogniversity/widgets/elevated_buttons.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/video_card_list.dart';
import 'package:flutter/material.dart';

// class CourseDetails extends StatefulWidget {
//   const CourseDetails({super.key});

//   @override
//   State<CourseDetails> createState() => _CourseDetailsState();
// }

// class _CourseDetailsState extends State<CourseDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: const Text("Course Details"),
//         centerTitle: true,
//       ),

//       body: const Column(
//         children: [
//           Text("Course details")
//         ],
//       ),
//     );
//   }
// }


class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.courseName, });

  final String courseName;
  // final snap;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {

  bool enrolled = false;

  //function to handle enroll task 
  // bool enroll(){
  //   return true;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.snap['title']),
        title: const Text("Course Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("url")


                      // image: NetworkImage("${widget.snap['thumbnail']}")                         ///to be updated
                      ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  
                  const MySpacer(height: 7,),
                  Center(
                    child: Text(
                      "${widget.courseName} information",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const MySpacer(height: 7,),
                  // Center(
                  //   child: Text("${widget.snap['description']} "),
                  // ),
                  const MySpacer(height: 7,),
                  
                  enrolled == false ? MyElevattedButton(
                      title: "Enroll",
                      color: Colors.black,
                      action: () {
                       setState(() {
                         enrolled = true;
                       });
                      })
                  :MyElevattedButton(
                      title: "Full Note",
                      action: () {
                        // LinkService()
                        //     .launchURL(widget.snap['fullNote'], context);
                      }),
                  const MySpacer(height: 7,),
                   Text(
                    "All Lessons",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const MySpacer(height: 7,),
                  enrolled == true? Padding(
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
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // LinkService().launchURL(widget.snap['groupChat'], context);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}

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
