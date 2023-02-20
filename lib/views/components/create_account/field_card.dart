import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../blocs/create_account/create_account_cubit.dart';

class FieldCard extends StatefulWidget {
  bool isSelected;
  int index;
  FieldCard({
    this.index = 0,
    this.isSelected = false,
    Key? key
  }) : super(key: key);

  @override
  State<FieldCard> createState() => _FieldCardState();
}

class _FieldCardState extends State<FieldCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: (){
        setState((){widget.isSelected = !widget.isSelected;});
        context.read<CreateAccountCubit>().s[widget.index] = !context.read<CreateAccountCubit>().s[widget.index] ;
      },
      child: AnimatedContainer(
        width: 40.w,
        height: 15.h,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: (widget.isSelected == true)? AppTheme.primaryClr.withOpacity(0.1): const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color:(widget.isSelected == true)? AppTheme.primaryClr : AppTheme.neutral300,width: 1 )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            CircleAvatar(
              radius: 6.8.w,
              backgroundColor: (widget.isSelected == true)? AppTheme.primaryClr : AppTheme.neutral300,
              child: CircleAvatar(
                  radius: 6.6.w,
                  backgroundColor: const Color(0xffFAFAFA),
                  child: const Icon(Icons.laptop_chromebook_rounded,color: Color(0xff292D32),)
              ),
            ),

            CustomText(
                "Information Technology",
                color: AppTheme.neutral900,
                fontSize: AppConsts.textSize.sp,
                maxLines: 2,
            )

          ],
        ),
      ),
    );
  }
}
