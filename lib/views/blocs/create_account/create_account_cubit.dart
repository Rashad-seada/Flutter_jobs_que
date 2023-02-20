import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  List s = List.generate(6, (index) => false);

  List<String> countries = [
    "United States",
    "Malaysia",
    "Singapore",
    "Indonesia",
    "Philiphines",
    "Polandia",
    "India",
    "Vietnam",
    "China",
    "Canada",
    "Saudi Arabia",
    "Argentina",
    "Brazil",
  ];

}
