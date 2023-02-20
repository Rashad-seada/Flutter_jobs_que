import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  double? width;
  double? height;
  Space({
    this.width,
    this.height,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
