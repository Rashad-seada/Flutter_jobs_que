class MyProfileEntity {
  bool? status;
  Data? data;

  MyProfileEntity({this.status, this.data});

}

class Data {
  int? id;
  int? userId;
  String? name;
  String? email;
  Null? mobile;
  Null? address;
  Null? language;
  Null? interstedWork;
  Null? offlinePlace;
  Null? remotePlace;
  Null? bio;
  Null? educationId;
  Null? experience;
  Null? personalDetailes;

  Data(
      {this.id,
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

  Data.fromJson(Map<String, dynamic> json) {
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