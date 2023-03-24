import 'package:jobs_que/domain/entities/profile/profile_language_entity.dart';
import 'package:jobs_que/domain/entities/profile/profile_intersted_work_entity.dart';

class ProfileLanguageModel extends ProfileLanguageEntity {
  ProfileLanguageModel(
    bool? status,
    Profile? data,
  ) : super(status: status, data: data);

  ProfileLanguageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Profile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
