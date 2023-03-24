import '../../../domain/entities/jobs/all_favorite_jobs_entity.dart';

class AllFavoriteJobsModel extends AllFavoriteJobsEntity {
  AllFavoriteJobsModel(
    bool? status,
    List<FavoriteJob>? data,
  ) : super(status: status, data: data);

  AllFavoriteJobsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FavoriteJob>[];
      json['data'].forEach((v) {
        data!.add(new FavoriteJob.fromJson(v));
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
