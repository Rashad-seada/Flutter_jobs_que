import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/message/message_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_strings.dart';
import '../../widgets/action_button.dart';
import '../../widgets/space.dart';

class MessageBottomSheet extends StatelessWidget {

  MessageBottomSheet({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Space(height: 4.h,),

        ActionButton(action: AppStrings.all,onTap: ()=> context.read<MessageCubit>().onTapAction(0,context),),

        ActionButton(action: AppStrings.unread,onTap: ()=> context.read<MessageCubit>().onTapAction(1,context),),

        ActionButton(action: AppStrings.spam,onTap: ()=> context.read<MessageCubit>().onTapAction(2,context),),

        ActionButton(action: AppStrings.archived,onTap: ()=> context.read<MessageCubit>().onTapAction(3,context),),

      ],
    );
  }
}
