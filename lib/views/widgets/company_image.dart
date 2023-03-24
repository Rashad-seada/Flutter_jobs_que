import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_theme.dart';
import 'cached_image.dart';

class CompanyImage extends StatelessWidget {
  double? width;
  double? height;
  String? imageUrl;
  CompanyImage({
    this.width,
    this.height,
    this.imageUrl,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppTheme.neutral100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedImage(
        imageUrl: "$imageUrl",
        errorWidget: (context,text,error) => Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AppImages.company),
        ),
        placeHolder: (context,string)=> Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AppImages.company),
        ),
      ),
    );
  }
}
