import 'package:jobs_que/domain/entities/auth/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel(
    bool? status,
    String? data,
  ) : super(status: status, data: data);

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}
