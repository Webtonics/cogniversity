import 'package:flutter/widgets.dart';

class MySpacer extends StatelessWidget {
  const MySpacer({super.key, this.height, this.width});

  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      width: width,
    );
  }
}