import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/create_account/create_account_cubit.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/main_tabs.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import 'country_chip.dart';

class CreateAccountSecondBody extends StatelessWidget {
  const CreateAccountSecondBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        MainTabs(
          children: context.read<CreateAccountCubit>().workOptions,
          width: 85.w,
          height: 5.5.h,
          onTapChange: (index){
            context.read<CreateAccountCubit>().selectedOption = index;
          },
        ),
        
        Space(height: 3.h,),
        
        CustomText(
            AppStrings.createAccountThirdBodyText2,
            color: AppTheme.greyClr,
        ),

        Space(height: 3.h,),


        SingleChildScrollView(
          child: Wrap(
            spacing: 12,
            children: List.generate(
                context.read<CreateAccountCubit>().countries.length,
                (index) => AnimationConfiguration.staggeredList(
                  position: index,
                  child: FadeInAnimation(
                    duration: Duration(milliseconds: 300),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 300),
                      child: CountryChip(
                        isSelected: context.read<CreateAccountCubit>().countriesSelected[index],
                        country: context.read<CreateAccountCubit>().countries[index],
                        index: index,
                      ),
                    ),
                  ),
                )
            )
          ),
        ),
      ],
    );
  }
}
