import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';

class CustomNavBar extends StatelessWidget {
  int currentIndex;
  List labels;
  Function(int)? onTap;

  CustomNavBar({
    required this.currentIndex,
    required this.labels,
    required this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: currentIndex,
      items:[
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.asset(AppImages.homeNavIcon(active: (currentIndex == 0)? true: false)),
          ),
          label: labels[0],
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.asset(AppImages.messageNavIcon(active: (currentIndex == 1)? true: false)),
          ),
          label: labels[1],
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.asset(AppImages.appliedNavIcon(active: (currentIndex == 2)? true: false)),
          ),
          label: labels[2],
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.asset(AppImages.savedNavIcon(active: (currentIndex == 3)? true: false)),
          ),
          label: labels[3],
        ),

        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.asset(AppImages.profileNavIcon(active: (currentIndex == 4)? true: false)),
          ),
          label: labels[4],
        ),
      ],

      onTap: (index) {
        onTap!(index);
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,

      selectedItemColor: AppTheme.primary500Clr,
      unselectedItemColor: AppTheme.neutral500,

      unselectedLabelStyle: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppTheme.neutral500,
          fontSize: AppConsts.subTextSize.sp - 2.sp,
          fontWeight: FontWeight.w400,

        ),
      ),
      selectedLabelStyle:  GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppTheme.primary500Clr,
          fontSize: AppConsts.subTextSize.sp - 2.sp,
          fontWeight: FontWeight.w400,

        ),
      ),
    );
  }
}
