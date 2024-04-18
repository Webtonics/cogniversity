
import 'package:cogniversity/widgets/course_carosel.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:flutter/material.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {

  // int currentTab = 0;
  List<Widget>tabs = [
    Tab( text: "In Progress", child: const CoursesDefaultView(), ),
    Tab(text: "Downloaded",child: const CoursesDefaultView(),)
  ];

  List<Widget>views = [const CoursesDefaultView(), const CoursesDefaultView() ];
  // final TabController _tabController = TabController(length: 3, vsync:NavigatorState());

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
           bottom: TabBar(tabs: tabs),
        )
      ),
    );
  }
}

class CoursesDefaultView extends StatelessWidget {
  const CoursesDefaultView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Center(child: Text("Courses View"),),

            //Spacer
            const MySpacer(height: 10,),

            SizedBox(
              height: 170,
              child: ListView(children: [
                Container(
                    height: 120,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        // color: Colors.greenAccent,
                        // color: Colors.deepOrangeAccent,
                        color: Colors.black,
                        image: DecorationImage(
                            // invertColors: true,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.darken),
                            // opacity: 0.6,
                            image: const NetworkImage(
                                "https://images.unsplash.com/photo-1618044733300-9472054094ee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGRhdGElMjBhbmFseXNpc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"))),
                    child: Row(children: [
                      //image
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Track Your Progress",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ))
                        ],
                      ),
                    ]))
              ]),
            ),


            const MySpacer(height: 5,),
            //course carosel
            const CourseCarosel(direction: Axis.horizontal,),
          ],
        ),
      ),
    );
  }
}