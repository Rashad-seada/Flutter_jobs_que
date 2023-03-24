import 'package:hive/hive.dart';

class ProfileInterstedWorkEntity {
  bool? status;
  Profile? data;

  ProfileInterstedWorkEntity({this.status, this.data});
}


@HiveType(typeId: 0)
class Profile extends HiveObject{
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? userId;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? mobile;

  @HiveField(5)
  String? address;

  @HiveField(6)
  String? language;

  @HiveField(7)
  String? interstedWork;

  @HiveField(8)
  String? offlinePlace;

  @HiveField(9)
  String? remotePlace;

  @HiveField(10)
  String? bio;

  @HiveField(11)
  String? educationId;

  @HiveField(12)
  String? experience;

  @HiveField(13)
  String? personalDetailes;

  Profile(
      {
        this.id,
        this.userId,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.language,
        this.interstedWork,
        this.offlinePlace,
        this.remotePlace,
        this.bio,
        this.educationId,
        this.experience,
        this.personalDetailes});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    language = json['language'];
    interstedWork = json['intersted_work'];
    offlinePlace = json['offline_place'];
    remotePlace = json['remote_place'];
    bio = json['bio'];
    educationId = json['education_id'];
    experience = json['experience'];
    personalDetailes = json['personal detailes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['language'] = this.language;
    data['intersted_work'] = this.interstedWork;
    data['offline_place'] = this.offlinePlace;
    data['remote_place'] = this.remotePlace;
    data['bio'] = this.bio;
    data['education_id'] = this.educationId;
    data['experience'] = this.experience;
    data['personal detailes'] = this.personalDetailes;
    return data;
  }
}