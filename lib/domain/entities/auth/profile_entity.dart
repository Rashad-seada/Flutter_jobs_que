class ProfileEntity {
  Data? data;
  bool? status;

  ProfileEntity({this.data, this.status});


}

class Data {
  int? id;
  String? name;
  String? otp;
  Null? towStep;
  String? email;
  Null? emailVerifiedAt;

  Data(
      {this.id,
        this.name,
        this.otp,
        this.towStep,
        this.email,
        this.emailVerifiedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    otp = json['otp'];
    towStep = json['tow_step'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['otp'] = this.otp;
    data['tow_step'] = this.towStep;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}