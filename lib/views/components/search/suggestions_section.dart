import 'package:flutter/material.dart';
import 'package:jobs_que/views/components/search/suggestion_card.dart';
import 'package:jobs_que/views/components/search/suggestions_header.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/enums.dart';

class SuggestionsSection extends StatelessWidget {
  String sectionTitle;
  Search suggestionType;

  SuggestionsSection({
    required this.sectionTitle,
    required this.suggestionType,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SuggestionsHeader(title: sectionTitle,),
        Space(height: 3.h,),
        SizedBox(
            width: 100.w,
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return SuggestionCard(suggestionType:suggestionType);
              },
            )
        ),
      ],
    );
  }
}
