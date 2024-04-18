import 'package:flutter/material.dart';

class MyActionButton extends StatelessWidget {
  const MyActionButton({
    super.key, required this.page, required this.icon, required this.title,
  });
  final Widget page;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
    }, icon: Icon(icon), label: Text(title));
  }
}