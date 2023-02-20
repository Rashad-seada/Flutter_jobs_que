part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

//password is changing
class AuthFormFieldsIsChanging extends AuthState {
  @override
  List<Object> get props => [];
}

//authing methods
class AuthIsSignIn extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthIsSignUp extends AuthState {
  @override
  List<Object> get props => [];
}

//authing states
class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthHasError extends AuthState {
  @override
  List<Object> get props => [];
}

//authing third-parties
class AuthByGoogle extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthByFacebook extends AuthState {
  @override
  List<Object> get props => [];
}


