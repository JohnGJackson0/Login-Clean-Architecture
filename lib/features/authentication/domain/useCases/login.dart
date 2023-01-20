import 'package:dartz/dartz.dart';
import 'package:login_clean_architecture/features/authentication/domain/entities/user.dart';
import 'package:login_clean_architecture/features/authentication/domain/repositories/AuthenticationRepository.dart';
import '../../../../core/error/failures.dart';

class Login {
  final AuthenticationRepository repository;

  Login(this.repository);

  Future<Either<Failure, User>> call({required email, password}) async {
    return await repository.login(email: email, password: password);
  }
}
