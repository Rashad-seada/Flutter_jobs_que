import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/components/message/chat_card.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';
import '../../blocs/message/message_cubit.dart';

class ChatSection extends StatelessWidget {

  ChatSection({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      height: 50.h,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemBuilder: (_,index){
            return ChatCard();
          },
          separatorBuilder: (_,index){
            return const Divider(
              color: AppTheme.neutral200,
            );
          },
          itemCount: context.read<MessageCubit>().chatRooms.length
      ),
    );
  }
}
