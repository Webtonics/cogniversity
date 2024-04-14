

import 'package:cogniversity/views/root.dart';
import 'package:flutter/material.dart';

class TabletView extends StatelessWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Tablet view"),
            Container(
              padding: const EdgeInsets.all(20),
              child: const RootApp(),
            )
          ],
        ),
      ),
    );
  }
}

