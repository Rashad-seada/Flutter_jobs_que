import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/domain/entities/jobs/recent_jobs_entity.dart';
import 'package:jobs_que/views/components/search/suggestion_card.dart';
import 'package:jobs_que/views/components/search/suggestions_header.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_enums.dart';
import '../../blocs/search/search_cubit.dart';

class SuggestionsSection extends StatelessWidget {
  String sectionTitle;
  Search suggestionType;
  List<RecentJob> suggestions;

  SuggestionsSection({
    required this.sectionTitle,
    required this.suggestionType,
    required this.suggestions,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Space(height: 2.h,),
        SuggestionsHeader(title: sectionTitle,),
        Space(height: 2.5.h,),
        SizedBox(
            width: 100.w,
            child: ListView.builder(
              itemCount: suggestions.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return SuggestionCard(
                  onTap: () {
                    SearchCubit.searchController.text = suggestions[index].name!;
                    context.read<SearchCubit>().getSearchResult(context);
                  },
                  suggestionType:suggestionType,
                  suggest: "${suggestions[index].name}",
                );
              },
            )
        ),
      ],
    );
  }
}
