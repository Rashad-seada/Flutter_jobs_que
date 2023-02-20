import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/enums.dart';
import 'package:jobs_que/core/validator/validator.dart';
import '../../screens/02_auth_screen.dart';
import '../../screens/03_create_account_screen.dart';
import '../../widgets/custom_page_transition.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit() : super(AuthInitial());

  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  late bool isChecked ;
  final ValidatorImpl _validator = ValidatorImpl();

  GlobalKey<FormState> getFormKey(AuthOptions option){
    if(option == AuthOptions.signIn) return signInFormKey;
    return signUpFormKey;
  }

  authType(AuthOptions option){
    emit(AuthInitial());
    if(option == AuthOptions.signIn){
      emit(AuthIsSignIn());
    }else if(option == AuthOptions.signUp){
      emit(AuthIsSignUp());
    }
  }

  String? isEmailValid(){
    emit(AuthFormFieldsIsChanging());
    if(emailController.text.isEmpty) {
      emit(AuthInitial());
      return AppStrings.enterYour(AppStrings.email);
    }
    if(_validator.isEmail(emailController.text.trim())) {
      emit(AuthInitial());
      return AppStrings.enterAValid(AppStrings.email);
    }
    return null;
  }

  String? isUsernameValid(){
    emit(AuthFormFieldsIsChanging());
    if(userNameController.text.isEmpty) {
      emit(AuthInitial());
      return AppStrings.enterYour(AppStrings.username);
    }
    if(_validator.isUsername(userNameController.text.trim())) {
      emit(AuthInitial());
      return AppStrings.enterAValid(AppStrings.username);
    }
    return null;
  }

  String? isPasswordValid(){
    emit(AuthFormFieldsIsChanging());
    if(passwordController.text.isEmpty) {
      emit(AuthInitial());
      return AppStrings.enterAValid(AppStrings.password);
    }
    if(_validator.isPassword(passwordController.text.trim())) {
      emit(AuthInitial());
      return AppStrings.createAccountFirstBodyText2;
    }
    return null;
  }

  bool isAllValid({required AuthOptions option}){

    if(option == AuthOptions.signIn){
      if(
          isEmailValid() == null &&
          isPasswordValid() == null
      )return true;
      return false;
    }else{
      if(
          isEmailValid() == null &&
          isUsernameValid() == null &&
          isPasswordValid() == null
      )return true;
      return false;
    }

  }

  void onButtonTap(context,AuthOptions option){
    if(option == AuthOptions.signIn){
      if(signInFormKey.currentState!.validate() == false){

      }else{
        Navigator.pushAndRemoveUntil(context, CustomPageTransition(CreateAccountScreen()), (route) => true);
      }
    }else if(option == AuthOptions.signUp){
      if(signUpFormKey.currentState!.validate() == false){

      }else{
        Navigator.pushAndRemoveUntil(context, CustomPageTransition(CreateAccountScreen()), (route) => true);
      }
    }
  }

  void onTextTap(context,options){
    _clearTextControllers();
    if(options == AuthOptions.signUp){
      Navigator.push(context, CustomPageTransition(AuthScreen(option: AuthOptions.signIn,)));
    }else{
      Navigator.pop(context);
    }
  }


  nativeAuth(AuthOptions option){

  }

  authByGoogle(AuthOptions option){

  }

  authByFacebook(AuthOptions option){

  }

  void _clearTextControllers(){
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

}
