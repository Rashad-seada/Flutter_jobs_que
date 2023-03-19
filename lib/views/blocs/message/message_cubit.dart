import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/domain/entities/message_entity.dart';
import 'package:meta/meta.dart';
import 'package:sizer/sizer.dart';
import '../../components/message/message_bottom_sheet.dart';
import '../../widgets/bottom_sheet.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  int selectChatFilter = 0;
  List chatRooms = [];

  onTapAction(index,context){

    selectChatFilter = index;
    getChat(index);

    emit(MessageFilterChanged());
    emit(MessageInitial());

    Navigator.pop(context);
  }

  onFilterTap(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) =>
            MainBottomSheet(
              height: 40.h,
              child: MessageBottomSheet(),
            )
    );
  }

  _getAllChats() {
    chatRooms = [0, 0, 0, 0, 0];
  }

  _getUnreadChat() {
    chatRooms = [0, 0, 0, 0];
  }

  _getSpamChat() {
    chatRooms = [0, 0, 0];
  }

  _getArchivedChat() {
    chatRooms = [0, 0,];
  }

  String getSectionTitle(){
    switch (selectChatFilter) {

      case 1:
        return AppStrings.unread;

      case 2:
        return AppStrings.spam;

      case 3:
        return AppStrings.archived;

      default:
        return _getAllChats();

    }
  }

  getChat(index) {
    switch (index) {
      case 0:
        _getAllChats();
        break;

      case 1:
        _getUnreadChat();
        break;

      case 2:
        _getSpamChat();
        break;

      case 3:
        _getArchivedChat();
        break;

      default:
        _getAllChats();
        break;

    }

  }

  getMessages(int senderId) {
    return <MessageEntity>[
      MessageEntity("We have to offer you", "10:00 AM", false,),
      MessageEntity("No I dont wanna hear any offers", "10:00 AM", true,),
      MessageEntity("sur you have to conseder our offer","10:00 AM", false,),
      MessageEntity("NOB!", "10:00 AM", true,),
      MessageEntity("Trust me you have a mental illness", "10:00 AM", false,),
      MessageEntity("this is none of your business", "10:01 AM",true,),
      MessageEntity("I hope is sucks your you", "10:01 AM", false,),
      MessageEntity("thanx :)", "10:02 AM", true),
      MessageEntity("your welcome :)", "10:02",false,),
      MessageEntity("tell me about your mom", "10:02 AM", false,),
      MessageEntity("I am sure she is better than yours ", "10:02 AM", true),
      MessageEntity("you think so?", "10:02",false,),
    ];
  }


}
