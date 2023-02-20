import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';

class MainButton extends StatefulWidget {
  double? width;
  double? height;
  Color color;
  Color borderColor;
  Widget? child;
  Function()? onTap;
  MainButton({
    this.width,
    this.height,
    this.color = AppTheme.primaryClr,
    this.borderColor = Colors.transparent,
    this.child,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 50),);
    animation = Tween<double>(begin: 0,end: 10).animate(controller)..addListener(() {setState(() {});});
    super.initState();
  }

  void dispose(){
    controller.dispose();
    super.dispose();
  }

  animate(){
    controller.forward().then((value) => controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          animate();
        });

        widget.onTap!();

      },

      child: AnimatedContainer(
        alignment: Alignment.center,
        curve: Curves.fastLinearToSlowEaseIn,
        width: widget.width! + animation.value,
        height:  widget.height! + animation.value,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular((widget.height!+ animation.value)/2),
          border: Border.all(color: widget.borderColor)
        ),
        duration: const Duration(milliseconds: 500),
        child: widget.child,
      ),
    );
  }
}
