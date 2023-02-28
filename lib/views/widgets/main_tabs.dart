import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'custom_text.dart';

class MainTabs extends StatefulWidget {
  double? height;
  double? width;
  ValueChanged<int>? onTapChange;
  List<String> children;

  MainTabs({
    this.height,
    this.width,
    this.onTapChange,
    required this.children,
    Key? key}) : super(key: key);

  int _animateToIndex = 0;

  @override
  State<MainTabs> createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> with TickerProviderStateMixin{
  late List<AnimationController> controllers;
  late List<Animation<Color?>> animations;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(widget.children.length , (index) => AnimationController(vsync: this,duration: Duration(milliseconds: 250),));
    animations = List.generate(widget.children.length , (index) => ColorTween(begin: AppTheme.neutral500,end: Colors.white,).animate(controllers[index])..addListener(() {
      setState(() {
      });
    }));

    controllers[0].forward();

  }

  @override
  void dispose() {
    controllers.forEach((element) => element.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      clipBehavior: Clip.hardEdge,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppTheme.neutral100,
        borderRadius: BorderRadius.circular(widget.height! / 2),
      ),

      child: Stack(
        children: [

            //selected tab
            AnimatedPositioned(
              left: widget.width!/(widget.children.length ) *widget._animateToIndex,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Container(
              width: widget.width!/(widget.children.length ),
              height: widget.height,
              decoration: BoxDecoration(
                color: AppTheme.infoClr,
                borderRadius: BorderRadius.circular(widget.height! / 2),
                ),
              ),
            ),

          Row(
            children: List.generate((widget.children.length ), (index) => Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(widget.width! / 2),
                  onTap: (){
                    widget.onTapChange;
                    widget.onTapChange?.call(index);

                    controllers[widget._animateToIndex].reverse();
                    controllers[index].forward();

                    setState(() {
                      widget._animateToIndex = index;
                    });

                  },
                  child: Center(
                      child: CustomText(
                          widget.children[index],
                          color: animations[index].value,
                          fontSize: AppConsts.subTextSize.sp,
                      )
                  )
                )),
            )
          )


        ],
      ),
    );
  }
}
