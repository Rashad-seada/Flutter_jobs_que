import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainScaffold extends StatelessWidget {
  Widget? child;
  Widget? bottomNavigationBar;
  Color? backgroundColor;
  Key? key;

  MainScaffold({
    this.child,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key,
        backgroundColor: backgroundColor,
        body: ListView(
          shrinkWrap: true,
            children: [
            SizedBox(
              width: 100.w,
              height: 96.h,
              child: child,
          )]
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
