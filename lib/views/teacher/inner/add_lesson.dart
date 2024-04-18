import 'package:flutter/material.dart';

class AddLessonView extends StatefulWidget {
  const AddLessonView({super.key});

  @override
  State<AddLessonView> createState() => _AddLessonViewState();
}

class _AddLessonViewState extends State<AddLessonView> {
  PageController pageController = PageController();
  
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  List<Widget>pages = [
    Container(
      color: Colors.white70,
      child: const Center(
        child: Text("Page 1"),
      ),
    ),
    Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text("Page 2"),
      ),
    ),
    Container(
      color: Colors.amber,
      child: const Center(
        child: Text("Page 3"),
      ),
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add Lesson"),
      ),

      body: Container(
        // padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                     pageController.previousPage(duration: const Duration(seconds: 1), curve:accelerateEasing);
                     
                  }, child: const Text("Back")),
                  TextButton(onPressed: (){
                     pageController.nextPage(duration: const Duration(seconds: 1), curve:accelerateEasing);
                  }, child: const Text("Next")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}