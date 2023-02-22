import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';

class MainSwitch extends StatefulWidget {
  bool isOn;
  ValueChanged<bool?>? onChanged;

  MainSwitch({
    required this.isOn,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<MainSwitch> createState() => _MainSwitchState();
}

class _MainSwitchState extends State<MainSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: AppTheme.neutral100,
        activeTrackColor: AppTheme.primary500Clr,

        inactiveTrackColor: Colors.white,
        //inactiveThumbColor: AppTheme.neutral100,

        value: widget.isOn,
        onChanged: (isOn){
            setState(() {
              widget.isOn = isOn;
            });
            widget.onChanged?.call(isOn);
            widget.onChanged;
    });
  }
}
