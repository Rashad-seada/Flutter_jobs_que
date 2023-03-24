import 'package:jobs_que/domain/entities/auth/login_entity.dart';

class LoginModel extends LoginEntity {

  LoginModel(
    User? user,
    String? token,
    bool? status,
  ) : super(user: user, token: token, status: status);

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['\$user'] != null ? User.fromJson(json['\$user']) : null;
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['\$user'] = user!.toJson();
    }
    data['token'] = token;
    data['status'] = status;
    return data;
  }


}
