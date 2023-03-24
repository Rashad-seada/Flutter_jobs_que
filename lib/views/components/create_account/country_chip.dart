import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_theme.dart';
import '../../blocs/create_account/create_account_cubit.dart';
import '../../widgets/custom_text.dart';

class CountryChip extends StatefulWidget {
  bool isSelected;
  int index;
  Country country;

  CountryChip({
    required this.index,
    required this.country,
    this.isSelected = false,
    Key? key
  }) : super(key: key);


  @override
  State<CountryChip> createState() => _CountryChipState();
}

class _CountryChipState extends State<CountryChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          setState((){widget.isSelected = !widget.isSelected;});
          context.read<CreateAccountCubit>().countriesSelected[widget.index] = !context.read<CreateAccountCubit>().countriesSelected[widget.index] ;
        },

        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: (widget.isSelected == true)? AppTheme.primary500Clr.withOpacity(0.1): const Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(100.h),
            border: Border.all(color:(widget.isSelected == true)? AppTheme.primary500Clr : AppTheme.neutral300,width: 1 ),
          ),
          margin: EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              CircleAvatar(
                radius: 4.w,
                backgroundColor: AppTheme.primary500Clr,
              ),

              Space(width: 2.w,),

              CustomText(widget.country.countryName,fontSize: AppConsts.textSize.sp - 1.sp,color: AppTheme.neutral900,),

            ],
          ),
      ),

    );
  }
}
