import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainScaffold extends StatelessWidget {
  Widget? child;
  MainScaffold({
    this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
            children: [
            SizedBox(
              width: 100.w,
              height: 96.h,
              child: child,
          )]
        ),
      ),
    );
  }
}
