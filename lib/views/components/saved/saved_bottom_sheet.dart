import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/action_button.dart';

class SavedBottomSheet extends StatelessWidget {
  const SavedBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Space(height: 4.h,),

        ActionButton(action: AppStrings.applyNow, actionImages: AppImages.applyJob,),

        ActionButton(action: AppStrings.shareVia, actionImages: AppImages.share,),

        ActionButton(action: AppStrings.cancelSave, actionImages: AppImages.close,),

      ],
    );
  }
}
