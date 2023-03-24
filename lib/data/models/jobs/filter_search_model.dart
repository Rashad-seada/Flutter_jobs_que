import 'package:jobs_que/domain/entities/jobs/filter_search_entity.dart';

class FilterSearchModel extends FilterSearchEntity {
  FilterSearchModel(
    bool? status,
    List<Data>? data,
  ) : super(status: status, data: data);

  FilterSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
