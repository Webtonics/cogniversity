import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SearchBar(
       backgroundColor: MaterialStatePropertyAll(Colors.white, ),
       leading:  Icon(Icons.search),
       // hintStyle: ,
       hintText: "Search Courses",
       trailing: [Icon(Icons.mic_none)],
              ),
    );
  }
}