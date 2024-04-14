import 'package:cogniversity/views/responsive/desktop_view.dart';
import 'package:cogniversity/views/responsive/mobile_view.dart';
import 'package:cogniversity/views/responsive/tablet_view.dart';
import 'package:flutter/material.dart';

class ResponsiveEngine extends StatelessWidget {
  const ResponsiveEngine({super.key});

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: ((context, constraints) {
      if(constraints.maxWidth < 350){
        return const Mobileview();
      }else if (constraints.maxWidth > 350 && constraints.maxWidth <800){
        return const TabletView();
      }else{
        return const DesktopView();
      }
    }),);
  }
}

