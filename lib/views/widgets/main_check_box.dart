import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';

class MainCheckBox extends StatefulWidget {
  bool isChecked;
  ValueChanged<bool?>? onChanged;
  MainCheckBox({
    required this.isChecked,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<MainCheckBox> createState() => _MainCheckBoxState();
}

class _MainCheckBoxState extends State<MainCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data:  ThemeData(
        unselectedWidgetColor: AppTheme.neutral400, // Your color
      ),
      child: Checkbox(

          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: const BorderSide(color: AppTheme.neutral400,width: 1.25),
          activeColor: AppTheme.primary500Clr,
          value: widget.isChecked,
          onChanged: (isChecked){
              setState(() {
                widget.isChecked = isChecked!;
              });
              widget.onChanged?.call(isChecked);
              widget.onChanged;
            },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
      ),
    );
  }
}
