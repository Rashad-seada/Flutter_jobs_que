import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sizer/sizer.dart';

import '../../components/saved/saved_bottom_sheet.dart';
import '../../widgets/bottom_sheet.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  openBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => MainBottomSheet(
              height: 33.h,
              child: SavedBottomSheet(),
            ));
  }
}
