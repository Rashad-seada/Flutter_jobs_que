import 'package:jobs_que/domain/entities/education/add_education_entity.dart';
import 'package:jobs_que/domain/entities/education/get_education_entity.dart';

class GetEducationModel extends GetEducationEntity {
  GetEducationModel(
    bool? status,
    List<Education>? data,
  ) : super(status: status, data: data);

  GetEducationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Education>[];
      json['data'].forEach((v) {
        data!.add(Education.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
