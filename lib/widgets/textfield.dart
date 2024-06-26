import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hinttext,
      required this.keyboardtype,
      required this.enabled, this.maxlines = 1}
      
      );
  final TextEditingController controller;
  final String label;
  final String hinttext;
  final TextInputType keyboardtype;
  final bool enabled;
  final int? maxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      enabled: enabled,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: null,
        label: Text(label),
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        fillColor: Colors.white54,
        filled: true,
      ),
    );
  }
}
