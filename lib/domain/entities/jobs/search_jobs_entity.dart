import 'package:jobs_que/domain/entities/jobs/recent_jobs_entity.dart';

class SearchJobsEntity {
  bool? status;
  List<RecentJob>? data;

  SearchJobsEntity({this.status, this.data});

}
