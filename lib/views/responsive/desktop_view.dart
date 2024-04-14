

import 'package:cogniversity/views/root.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Desktop view"),
            Container(
              padding: const EdgeInsets.all(60),
              child: const RootApp(),
            )
          ],
        ),
      ),
    );
  }
}