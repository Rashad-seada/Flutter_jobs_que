import 'package:floor/floor.dart';

class RecentJobsEntity {
  bool? status;
  List<RecentJob>? data;

  RecentJobsEntity({this.status, this.data});

}

@entity
class RecentJob {
  @primaryKey
  int? id;

  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;


  RecentJob(
      {this.id,
        this.name,
        this.image,
        this.jobTimeType,
        this.jobType,
        this.jobLevel,
        this.jobDescription,
        this.jobSkill,
        this.compName,
        this.compEmail,
        this.compWebsite,
        this.aboutComp,
        this.location,
        this.salary,
        this.favorites,
        this.expired,
       });

  RecentJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    jobTimeType = json['job_time_type'];
    jobType = json['job_type'];
    jobLevel = json['job_level'];
    jobDescription = json['job_description'];
    jobSkill = json['job_skill'];
    compName = json['comp_name'];
    compEmail = json['comp_email'];
    compWebsite = json['comp_website'];
    aboutComp = json['about_comp'];
    location = json['location'];
    salary = json['salary'];
    favorites = json['favorites'];
    expired = json['expired'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['job_time_type'] = jobTimeType;
    data['job_type'] = jobType;
    data['job_level'] = jobLevel;
    data['job_description'] = jobDescription;
    data['job_skill'] = jobSkill;
    data['comp_name'] = compName;
    data['comp_email'] = compEmail;
    data['comp_website'] = compWebsite;
    data['about_comp'] = aboutComp;
    data['location'] = location;
    data['salary'] = salary;
    data['favorites'] = favorites;
    data['expired'] = expired;

    return data;
  }
}