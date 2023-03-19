import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/message/message_cubit.dart';
import 'package:jobs_que/views/components/message/message_section.dart';
import 'package:jobs_que/views/layouts/02_chat_room_layout.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../components/message/message_room_appbar.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Flexible(
                child: MessageSection(messages: context.read<MessageCubit>().getMessages(1),),
              ),

              ChatRoomLayout(),
            ],
          ),
        ),
      ),
    );
  }
}
