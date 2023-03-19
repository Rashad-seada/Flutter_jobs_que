import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';
import '../../blocs/language/language_cubit.dart';
import 'language_card.dart';

class LanguageSection extends StatelessWidget {
  List<LanguageCard> languageCards;
  int selectedIndex;

  LanguageSection({
    this.selectedIndex = 0,
    required this.languageCards,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
          (selectedIndex == index)? languageCards[index].isSelected = true : false;
          languageCards[index].onTap = (){
            context.read<LanguageCubit>().onTapLanguageCard(index);
          };
          return languageCards[index];
        },
        separatorBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: const Divider(color: AppTheme.neutral300,),
          );
        },
        itemCount: languageCards.length
    );
  }
}
