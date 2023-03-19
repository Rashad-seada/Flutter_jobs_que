import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/views/blocs/message/message_cubit.dart';
import 'package:jobs_que/views/components/message/chat_section.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/search_bar.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_strings.dart';
import '../components/search/suggestions_header.dart';
import '../widgets/circle_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/space.dart';


class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Column(
          children: [

            Space(
                height: AppConsts.appbarSpace.h
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  AppStrings.messages,
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),

            Space(
                height: 2.h
            ),

            SizedBox(
              width: 85.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SearchBar(
                    width: 69.w,
                  ),

                  CircleButton(
                    onTap: () =>
                        context.read<MessageCubit>().onFilterTap(context),
                    icon: SvgPicture.asset(AppImages.filter),
                  )
                ],
              ),
            ),

            Space(
                height: 2.h
            ),


            BlocConsumer<MessageCubit, MessageState>(
              listener: (context, state) {
                if(state is MessageInitial) print("initial");
                if(state is MessageFilterChanged) print("filter changed");
              },
              builder: (context, state) {
                return Column(
                  children: [
                    (context.read<MessageCubit>().selectChatFilter == 0)
                        ? SizedBox()
                        : SuggestionsHeader(title: context.read<MessageCubit>().getSectionTitle(),),
                    Space(
                        height: (context.read<MessageCubit>().selectChatFilter == 0)? 0: 2.h,
                    ),
                    ChatSection(),
                  ],
                );
              },
            ),




          ],
        )
    );
  }
}