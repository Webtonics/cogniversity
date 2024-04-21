import 'package:flutter/material.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Column(
        children: [
          Center(child: Text("Downloads"),)
        ],
      )

    );
  }
}

