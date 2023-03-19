import 'package:flutter/material.dart';
import 'package:jobs_que/domain/entities/message_entity.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import 'message_card.dart';

class MessageSection extends StatelessWidget {
  List<MessageEntity> messages;

  MessageSection({
    required this.messages,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Space(height: 13.h,),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: messages.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return MessageCard(message: messages[index],);
            }
        ),
        Space(height: 10.h,),

      ],
    );
  }
}
