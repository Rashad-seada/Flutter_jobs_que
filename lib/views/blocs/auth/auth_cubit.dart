import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_enums.dart';
import 'package:jobs_que/core/validator/validator.dart';
import 'package:jobs_que/domain/usecases/auth/login_usecase.dart';
import 'package:jobs_que/domain/usecases/auth/register_usecase.dart';
import '../../../core/config/app_images.dart';
import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../screens/03_create_account_screen.dart';
import '../../screens/08_main_screen.dart';
import '../../widgets/custom_page_transition.dart';
import '../../widgets/custom_snack_bar.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit() : super(AuthInitial());

  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  AuthOptions authOptions = AuthOptions.signIn;

  late bool isChecked ;
  final ValidatorImpl _validator = ValidatorImpl();

  GlobalKey<FormState> getFormKey(AuthOptions option){
    if(option == AuthOptions.signIn) return _signInFormKey;
    return _signUpFormKey;
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
    if(emailController.text.isEmpty) {
      return AppStrings.enterYour(AppStrings.email);
    }
    if(_validator.isEmail(emailController.text.trim())) {
      return AppStrings.enterAValid(AppStrings.email);
    }
    return null;
  }

  String? isUsernameValid(){
    if(userNameController.text.isEmpty) {
      return AppStrings.enterYour(AppStrings.username);
    }
    if(_validator.isUsername(userNameController.text.trim())) {
      return AppStrings.enterAValid(AppStrings.username);
    }
    return null;
  }

  String? isPasswordValid(){
    if(passwordController.text.isEmpty) {
      return AppStrings.enterAValid(AppStrings.password);
    }
    if(_validator.isPassword(passwordController.text.trim())) {
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

  void onButtonTap(context,AuthOptions option) async{
    emit(AuthLoading());
    
    if(option == AuthOptions.signIn){
      if(_signInFormKey.currentState!.validate() == false){
        emit(AuthInitial());
      }else {
        await signIn(context);
        emit(AuthIsSignIn());
        emit(AuthInitial());
      }

    }else if(option == AuthOptions.signUp){
      if(_signUpFormKey.currentState!.validate() == false){
        emit(AuthInitial());
      }else{

        await signUp(context);
        emit(AuthIsSignUp());
        emit(AuthInitial());
      }

    }
  }

  signIn(BuildContext context) async {
    await LoginUsecase().call(
        LoginParams(
          email: emailController.text.trim(),
          password: passwordController.text,
        )).then((value) => value.bimap(
          (error) {
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: error.message, iconImage: AppImages.error,));
      },
          (success) {
        if (success.status == true) {
          Navigator.push(context, CustomPageTransition(MainScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: "please check your email and password", iconImage: AppImages.wrong,));
        }
      },
    )
    );
  }

  signUp(BuildContext context) async {
    await RegisterUsecase().call(RegistrationParams(
        name: userNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text
    )).then((value) => value.bimap(
            (error) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: error.message, iconImage: AppImages.error,));
        },
            (success) {
          if (success.status == true) {
            Navigator.push(context, CustomPageTransition(CreateAccountScreen()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: "please check your data and try again", iconImage: AppImages.wrong,));
          }
        }
    )
    );
  }

  void onTextTap(){
    //_clearTextControllers();
    if(authOptions == AuthOptions.signUp) {
      emit(AuthIsSignUp());
      emit(AuthInitial());
      authOptions = AuthOptions.signIn;
    }
    else {
      emit(AuthIsSignIn());
      emit(AuthInitial());
      authOptions = AuthOptions.signUp;
    }
    print(authOptions);
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
