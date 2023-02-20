import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobs_que/core/config/enums.dart';
import 'package:jobs_que/core/validator/validator.dart';
import 'package:jobs_que/views/screens/06_enter_pin_screen.dart';
import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../screens/02_auth_screen.dart';
import '../../screens/04_message_screen.dart';
import '../../screens/07_create_new_password_screen.dart';
import '../../widgets/custom_page_transition.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController newPasswordController = TextEditingController(text: '');
  TextEditingController renterNewPasswordController = TextEditingController(text: '');
  TextEditingController pinController = TextEditingController(text: '');

  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> pinFormKey = GlobalKey<FormState>();

  bool isEmailValid = false;
  bool isPassword8Char = false;
  bool isPasswordMatch = false;
  bool isPinValid = false;

  String pinCode = "";

  Validator validator = ValidatorImpl();


  String? validateIsPassword8Char(){
    emit(ResetPasswordIsChanging());
    isPassword8Char = !validator.isPassword(newPasswordController.text);
    if(!validator.isPassword(newPasswordController.text)) {
      emit(ResetPasswordInitial());
      return null;
    }else{
      emit(ResetPasswordInitial());
      return '';
    }
  }

  String? validateIsPasswordMatch(){
    emit(ResetPasswordIsEmailChanging());
    if(
    renterNewPasswordController.text == newPasswordController.text &&
    renterNewPasswordController.text != '' &&
    newPasswordController.text != ''
    ) {
      emit(ResetPasswordInitial());
      isPasswordMatch = true;
      return null;
    }else{
      emit(ResetPasswordInitial());
      isPasswordMatch = false;
      return "";
    }
  }

  validateAllPasswords(){
    validateIsPassword8Char();
    validateIsPasswordMatch();
  }

  String? validateIsEmail(){
    emit(ResetPasswordIsEmailChanging());
    isEmailValid = !validator.isEmail(emailController.text);
    if(validator.isEmail(emailController.text) == false){
      emit(ResetPasswordInitial());
      return null;
    }else{
      emit(ResetPasswordInitial());
      return '';
    }
  }

  String? validatePin(){
    emit(ResetPasswordIsPinCodeChanging());
    if(pinCode == pinController.text){
      emit(ResetPasswordInitial());
      isPinValid = true;
      return null;
    }else{
      isPinValid = false;
      emit(ResetPasswordInitial());
      return 'Invalid Code';
    }
  }

  void onTapContinue(BuildContext context){
    Navigator.push(context, CustomPageTransition(const CreateNewPasswordScreen()));
  }

  void onTapResetPasswordButton(BuildContext context) async {
    if(emailFormKey.currentState!.validate()){
      await getPinCode();
      Navigator.push(
          context,
          CustomPageTransition(
              MessageScreen(
                image: AppImages.emailSent,
                headText: AppStrings.forgetPasswordSecondHeadText,
                subText: AppStrings.forgetPasswordSecondBodyText,
                buttonLable: AppStrings.next,
                onTap: (){
                  Navigator.push(context, CustomPageTransition(const EnterPinScreen()));
                },
              )
          )
      );
    }
    else{

    }
  }

  void onTapResetPasswordText(BuildContext context){
    Navigator.push(context, CustomPageTransition(AuthScreen(option: AuthOptions.signIn,)));
  }

  void onTapCreateNewPasswordButton(){
    if(newPasswordFormKey.currentState!.validate()){

    }else{

    }
  }

  void onTapEnterPinButton(BuildContext context){
    if(isPinValid){
      Navigator.push(context, CustomPageTransition(const CreateNewPasswordScreen()));
    }
  }

  void onTapEnterPinText(BuildContext context){
    getPinCode();
  }

  getPinCode(){
    pinCode = "1111";
  }


}
