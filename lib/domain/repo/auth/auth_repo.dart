import 'package:dartz/dartz.dart';
import 'package:jobs_que/domain/entities/auth/login_entity.dart';
import 'package:jobs_que/domain/entities/auth/my_profile_entity.dart';
import 'package:jobs_que/domain/entities/auth/otp_entity.dart';
import 'package:jobs_que/domain/entities/auth/profile_entity.dart';
import 'package:jobs_que/domain/entities/auth/registration_entity.dart';

import '../../../core/error/failure.dart';

abstract class AuthRepo {

  Future<Either<Failure,RegistrationEntity>> register({
        required String name,
        required String email,
        required String password,
      });

  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, OtpEntity>> getOtp({
    required String email,
    required String token,
  });

  Future<Either<Failure,ProfileEntity>> getUserProfile({
    required int id,
    required String token,
  });

  Future<Either<Failure,MyProfileEntity>> getMyProfile();

}