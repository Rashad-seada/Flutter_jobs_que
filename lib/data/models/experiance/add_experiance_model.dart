import '../../../domain/entities/experiance/add_experiance_entity.dart';

class AddExperienceModel extends AddExperienceEntity {
  AddExperienceModel(
    bool? status,
    Experience? data,
  ) : super(status: status, data: data);

  AddExperienceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Experience.fromJson(json['data']) : null;
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
