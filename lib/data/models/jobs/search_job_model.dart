import 'package:jobs_que/domain/entities/jobs/search_jobs_entity.dart';

import '../../../domain/entities/jobs/recent_jobs_entity.dart';

class SearchJobsModel extends SearchJobsEntity {
  SearchJobsModel(bool? status, List<RecentJob>? data)
      : super(status: status, data: data);

  SearchJobsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <RecentJob>[];
      json['data'].forEach((v) {
        data!.add(RecentJob.fromJson(v));
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
