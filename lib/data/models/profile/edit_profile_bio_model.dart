import 'package:jobs_que/domain/entities/profile/profile_bio_entity.dart';
import 'package:jobs_que/domain/entities/profile/profile_intersted_work_entity.dart';

class ProfileBioModel extends ProfileBioEntity {
  ProfileBioModel(
    bool? status,
    Profile? data,
  ) : super(status: status, data: data);

  ProfileBioModel.fromJson(Map<String, dynamic> json) {
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
