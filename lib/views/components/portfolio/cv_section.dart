import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../apply_job/cv_card.dart';

class CvSection extends StatelessWidget {
  List<CvCard> cvs;

  CvSection({
    required this.cvs,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: cvs.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return cvs[index];
    },
      separatorBuilder: (BuildContext context, int index) {
          return Space(height: 2.h,);
      });
  }
}
