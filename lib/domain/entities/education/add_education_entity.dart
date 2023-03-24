import 'package:floor/floor.dart';

class AddEducationEntity {
  bool? status;
  Education? data;

  AddEducationEntity({this.status, this.data});

}

@entity
class Education {
  @primaryKey
  int? id;

  String? universty;
  String? title;
  String? start;
  String? end;
  String? userId;
  int? profileId;
  String? updatedAt;
  String? createdAt;

  Education(
      {this.universty,
        this.title,
        this.start,
        this.end,
        this.userId,
        this.profileId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Education.fromJson(Map<String, dynamic> json) {
    universty = json['universty'];
    title = json['title'];
    start = json['start'];
    end = json['end'];
    userId = json['user_id'];
    profileId = json['profile_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['universty'] = this.universty;
    data['title'] = this.title;
    data['start'] = this.start;
    data['end'] = this.end;
    data['user_id'] = this.userId;
    data['profile_id'] = this.profileId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}