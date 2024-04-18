import 'package:cogniversity/views/teacher/inner/add_course.dart';
import 'package:cogniversity/widgets/course_carosel.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/my_action_button.dart';
import 'package:cogniversity/widgets/my_appbar.dart';
import 'package:cogniversity/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class LecturerDashboard extends StatefulWidget {
  const LecturerDashboard({super.key});

  @override
  State<LecturerDashboard> createState() => _LecturerDashboardState();
}

class _LecturerDashboardState extends State<LecturerDashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 15, 84),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: MyAppBar(),
              ),
              const MySpacer(height: 7,),              
              //title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Start Teaching Async today",style: Theme.of(context).textTheme.titleLarge,)),
              ),
              const MySpacer(height: 7,),
          
              //Searchbar
              const MySearchBar(),
              const MySpacer(height: 23,), 

              // Your courses
              

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                // height: 800,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(child: Text("Your Courses",style: Theme.of(context).textTheme.titleMedium,)),
                          const MyActionButton( icon: Icons.add, title: "Add Course",page: AddNewCourse(), )
                        ],
                      ),
                    ),
                    const MySpacer(height: 3,),
                    const SizedBox(
                      height:1000,
                      child: CourseCarosel(direction:Axis.vertical)),
                  ],
                ),
              ),

              
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}

