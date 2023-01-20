import 'package:dartz/dartz.dart';
import 'package:login_clean_architecture/features/authentication/domain/entities/user.dart';

import '../../../../core/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login({
    required email,
    required password,
  });
}
