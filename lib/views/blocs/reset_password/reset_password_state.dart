part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordIsChanging extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordIsEmailChanging extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordIsPinCodeChanging extends ResetPasswordState {
  @override
  List<Object> get props => [];
}