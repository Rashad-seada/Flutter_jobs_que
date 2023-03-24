import 'package:jobs_que/domain/entities/education/add_education_entity.dart';

class AddEducationModel extends AddEducationEntity {
  AddEducationModel(
    bool? status,
      Education? data,
  ) : super(status: status, data: data);

  AddEducationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Education.fromJson(json['data']) : null;
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
