import 'package:jobs_que/domain/entities/profile/profile_intersted_work_entity.dart';

class ProfileInterstedWorkModel extends ProfileInterstedWorkEntity {
  ProfileInterstedWorkModel(
    bool? status,
    Profile? data,
  ) : super(status: status, data: data);

  ProfileInterstedWorkModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Profile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
