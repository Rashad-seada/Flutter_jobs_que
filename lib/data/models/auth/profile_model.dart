import 'package:jobs_que/domain/entities/auth/profile_entity.dart';

class ProfileModel extends ProfileEntity {

  ProfileModel({Data? data,bool? status}): super(data: data,status: status);

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}