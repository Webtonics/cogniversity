import 'package:cogniversity/models/user_model.dart';
import 'package:cogniversity/providers/user_provider.dart';
import 'package:cogniversity/widgets/course_carosel.dart';
import 'package:cogniversity/widgets/my_appbar.dart';
import 'package:cogniversity/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserProvider>().getUser;
    if (user!= null){
      return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 15, 84),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //row 1

              ///My app bar
               MyAppBar(displayName: user.displayName, photoURL: user.photoURL,),
          
              const SizedBox(
                height: 10,
              ),
              //Text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Find your favorite Course here", style: Theme.of(context).textTheme.titleLarge,),
              ),
              
              const SizedBox(
                height: 10,
              ),
              
              //search bar
               const MySearchBar(),
              const SizedBox(
                height: 30,
              ),      
        
              // sections
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
              
                    Cards(),
                    Cards(),
                    Cards()
                  ],
                ),
              ),
      
              const SizedBox(height: 10,),
                    
              //row3:
              const SecondSection()        
            ],
          ),
        ),
      ),
    );
    }else{
      return const Center(child: CircularProgressIndicator());
    }
  }
}



class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration( color: Colors.white),
      // height: 700,
      child:   const Column(
        children: [
    
          //section: Trending = see all
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trending Courses", style: TextStyle(color: Color.fromARGB(255, 40, 15, 84)),),
              
                Text("See all")
              ],
            ),
          ),
          //list of carosels
          CourseCarosel( direction: Axis.horizontal,),
          
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reccomended Courses", style: TextStyle(color: Color.fromARGB(255, 40, 15, 84)),),
              
                Text("See all")
              ],
            ),
          ),
          CourseCarosel(direction: Axis.horizontal,),
        ],
      ),
    );
  }
}


class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h);
    // path.lineTo(w, h);
    path.quadraticBezierTo(
      w * 0.5,
      h - 100,
      w, 
      h,);
    path.lineTo(w, 0);
    path.close();
    // f
    // // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(            
      width: 90,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(17),
        ),
      // height: 50,
      // width: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 7,),
          const CircleAvatar(
            child: Icon(Icons.mic),
          ),
          const Text("Design"),
          // ignore: avoid_unnecessary_containers
          Container(
            
            child: const Text("10 Courses", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 11),),
          )
        ],
      ),
    );
  }
}