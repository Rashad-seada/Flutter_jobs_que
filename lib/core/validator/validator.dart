import 'package:regexpattern/regexpattern.dart';

abstract class Validator {

  bool isUsername(String username);

  bool isEmail(String email);

  bool isPassword(String password);

}



class ValidatorImpl implements Validator {

  @override
  bool isUsername(String username) {
    return !username.isUsername();
  }

  @override
  bool isEmail(String email) {
    return !email.isEmail();
  }

  @override
  bool isPassword(String password) {
    return !password.isPasswordEasyWithspace();
  }

}



