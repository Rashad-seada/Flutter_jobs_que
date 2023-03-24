import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';

abstract class Usecase<T,Params> {

 Future<Either<Failure,T>> call(Params params);

}