import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  int selectedIndex = 0;

  onTapLanguageCard(int index){
    emit(LanguageChanged());
    selectedIndex = index;
    emit(LanguageInitial());
  }
}
