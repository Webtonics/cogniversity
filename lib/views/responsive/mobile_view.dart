import 'package:cogniversity/views/root.dart';
import 'package:flutter/material.dart';

class Mobileview extends StatelessWidget {
  const Mobileview({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // const Text("Mobile view"),
              Container(
                padding: const EdgeInsets.all(0),
                child: const RootApp(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

