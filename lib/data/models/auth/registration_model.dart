import 'package:jobs_que/domain/entities/auth/registration_entity.dart';

class RegistrationModel extends RegistrationEntity {

  RegistrationModel({
    bool? status,
    Data? data,
    Profile? profile,
    String? token,
  }) : super(
    status: status,
    data: data,
    profile: profile,
    token: token,
  );

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    data['token'] = token;
    return data;
  }

}