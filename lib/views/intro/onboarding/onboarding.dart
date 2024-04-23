import 'package:cogniversity/views/root.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();

  List<Widget> pages = [
    Container(
      color: Colors.redAccent,
      child: const Center(child: Text("data"),),
    ),
    Container(
      color: Colors.deepPurple,
      child: const Center(child: Text("data"),),
    ),
    Container(
      color: Colors.black,
      child: const Center(child: Text("data"),),
    ),
    const Pageview1()
    
  ];
  // int currentpage = 0;

  

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
        
    //     children: [
    //       Expanded(
    //           child: PageView(
    //             controller: pageController,
    //             children: pages,
    //           ),
    //         ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           color: Colors.amber,
    //           // padding: const EdgeInsets.all(12),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               ElevatedButton(onPressed: (){
    //                 pageController.previousPage(duration: Duration.zero, curve:Curves.bounceIn);
    //               }, child: const Text("Back")),
    //               ElevatedButton(onPressed: (){
    //                 pageController.nextPage(duration: Duration.zero, curve:Curves.bounceIn);
    //               }, child: const Text("Next")),
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: 
            PageView(
               
              controller: pageController,
              children:pages
              //  [
              // OnboardingPage(pageController: pageController, color: Colors.deepOrange, widget: const Center(child: Text("data"),),),
              // OnboardingPage(pageController: pageController, color: Colors.deepPurple, widget: const Center(child: Text("data"),),),
              // OnboardingPage(pageController: pageController, color: Colors.deepOrangeAccent, widget: const Center(child: Text("data"),),),
            
              // ]
            ),
            
        ),
        
      
      bottomSheet:Container(
       height: 80,
       color:Colors.transparent,
        // padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: (){
                pageController.previousPage(duration: Duration.zero, curve:Curves.bounceIn);
              }, child: const Text("Back")),

              Center(child: SmoothPageIndicator(controller: pageController, 
              effect: const WormEffect(dotHeight: 10, dotWidth: 10),count: pages.length)),
              ElevatedButton(onPressed: (){
                pageController.nextPage(duration: Duration.zero, curve:Curves.bounceIn);
              }, child: const Text("Next")
              )
            ]
              ),
        )
            ),
    );
  }
    
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.pageController, required this.color, required this.widget,
  });

  final PageController pageController;
  final Color color;
  final Widget widget;
  

  @override
  Widget build(BuildContext context) {
    return Container(
    color: color,
    child: widget
    );
  }
}

class Pageview1 extends StatelessWidget {
  const Pageview1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // color: Colors.deepOrange,
      child: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const RootApp())));
            }, child: const Text("Proceed")),
          ),
        ],
      ) ,
    );
  }
}