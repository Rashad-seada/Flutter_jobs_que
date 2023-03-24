import 'package:jobs_que/domain/entities/jobs/suggested_jobs_entity.dart';

class SuggestedJobsModel extends SuggestedJobsEntity {
  SuggestedJobsModel(
    bool? status,
    List<SuggestedJob>? data,
  ) : super(status: status, data: data);

  SuggestedJobsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SuggestedJob>[];
      json['data'].forEach((v) {
        data!.add(new SuggestedJob.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
