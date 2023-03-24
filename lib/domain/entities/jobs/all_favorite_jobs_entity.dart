import 'package:floor/floor.dart';

class AllFavoriteJobsEntity {
  bool? status;
  List<FavoriteJob>? data;

  AllFavoriteJobsEntity({this.status, this.data});

}

@entity
class FavoriteJob {
  @primaryKey
  int? id;

  int? userId;
  int? like;
  int? jobId;
  String? image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;

  FavoriteJob(
      {this.id,
        this.userId,
        this.like,
        this.jobId,
        this.image,
        this.name,
        this.location,
        this.createdAt,
        this.updatedAt});

  FavoriteJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    like = json['like'];
    jobId = json['job_id'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['like'] = this.like;
    data['job_id'] = this.jobId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}