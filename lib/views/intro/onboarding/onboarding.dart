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
      color: Colors.white54,
      child: const Column(
        children: [
          Center(child: Text("data"),),
        ],
      ),
    ),
    Container(
      color: Colors.pinkAccent,
      child: const Center(child: Text("data"),),
    ),
    Container(
      color: Colors.pink[200],
      child: const Center(child: Text("data"),),
    ),
    Container(
      color: Colors.pink[300],
      child: const Center(child: Text("data"),),
    ),
    // const Pageview1()
    
  ];

  bool isLast = false ;
  bool isFirst = true;

  back(){
    setState(() {
      isLast= true;
    });
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
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
              
            ),
            
        ),
        
      
      bottomSheet:Container(
       height: 80,
       color:Colors.transparent,
        // padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLast == false? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isLast? ElevatedButton(onPressed: (){
                pageController.previousPage(duration: const Duration( seconds: 1), curve:Curves.linear);
                setState(() {
                  isFirst = false;
                });
              }, child: const Text("Back")): ElevatedButton(onPressed: (){
                
                pageController.jumpToPage(3);
                back();
              }, child: const Text("Skip")),

              Center(child: SmoothPageIndicator(controller: pageController,
              onDotClicked: (index) {
                pageController.animateToPage(index, duration: const Duration( seconds: 1), curve:Curves.easeIn);
              }, 
              effect: const WormEffect(dotHeight: 10, dotWidth: 10),count: pages.length)),
              
              
              isLast == false? ElevatedButton(onPressed: (){
                pageController.nextPage(duration: const Duration( seconds: 1), curve:Curves.linear);
              }, child: const Text("Next"),
              ):
               ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const RootApp())));
              }, child: const Text("Finish"),
              )
            ]
              ): Container(
                height: 80,
                child: Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom( minimumSize: const Size(double.infinity, double.infinity), backgroundColor: Colors.deepPurple,),
                    onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const RootApp())));
                  }, child: const Text("Get Started", style: TextStyle(color: Colors.white))),
                ),
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
      
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom( minimumSize: const Size(double.infinity, double.infinity), backgroundColor: Colors.deepPurple,),
                  onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const RootApp())));
                }, child: const Text("Get Started", style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}