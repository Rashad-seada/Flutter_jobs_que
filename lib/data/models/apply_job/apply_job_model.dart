import 'package:jobs_que/domain/entities/apply_job/apply_job_entity.dart';

class ApplyJobModel extends ApplyJobEntity {
  ApplyJobModel(
    bool? status,
    Data? data,
  ) : super(status: status, data: data);

  ApplyJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
