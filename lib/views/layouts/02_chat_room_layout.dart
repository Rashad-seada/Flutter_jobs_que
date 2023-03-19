import 'package:flutter/material.dart';

import '../components/message/message_bottom_bar.dart';
import '../components/message/message_room_appbar.dart';

class ChatRoomLayout extends StatelessWidget {
  const ChatRoomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MessageRoomAppbar(),

        MessageBottomBar(),
      ],
    );
  }
}
