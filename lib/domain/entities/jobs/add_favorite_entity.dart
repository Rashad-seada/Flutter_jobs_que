class AddFavoriteJobEntity {
  bool? status;
  Data? data;

  AddFavoriteJobEntity({this.status, this.data});


}

class Data {
  String? userId;
  String? jobId;
  bool? like;
  String? image;
  String? name;
  String? location;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
        this.jobId,
        this.like,
        this.image,
        this.name,
        this.location,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    jobId = json['job_id'];
    like = json['like'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['job_id'] = jobId;
    data['like'] = like;
    data['image'] = image;
    data['name'] = name;
    data['location'] = location;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}