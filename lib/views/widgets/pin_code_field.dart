import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_theme.dart';


class PinCodeField extends StatefulWidget {
  TextEditingController? controller;
  Function(String pin)? onChange;
  Function(String pin)? onComplete;
  Function(String pin)? validator;
  Key? key;

  PinCodeField({
    this.controller,
    this.onChange,
    this.onComplete,
    this.validator,
    this.key,
  }) : super(key: key);

  @override
  State<PinCodeField> createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<PinCodeField> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    widget.controller?.clear();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppTheme.primaryClr;

    final defaultPinTheme = PinTheme(
      width: 25.w,
      height: 8.h,
      textStyle: TextStyle(
        fontSize: 22,
        color: AppTheme.neutral700,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppTheme.neutral700,),
        color: Colors.white,
      ),
    );

    return Pinput(
      key: widget.key,
      controller: widget.controller,
      focusNode: focusNode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      defaultPinTheme: defaultPinTheme,
      errorTextStyle: TextStyle(
        fontSize: AppConsts.subTextSize.sp,
        color: AppTheme.error,
      ),
      validator: (pin) => widget.validator!(pin!),
      onCompleted: (pin) => widget.onComplete!(pin),
      onChanged: (pin) => widget.onChange!(pin),

      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),

      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: focusedBorderColor),
        ),
      ),

      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: AppTheme.error),
      ),
    );
  }
}