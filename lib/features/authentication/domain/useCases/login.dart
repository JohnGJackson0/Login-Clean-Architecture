import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:login_clean_architecture/features/authentication/domain/entities/user.dart';
import 'package:login_clean_architecture/features/authentication/domain/repositories/AuthenticationRepository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/useCase.dart';

class Params extends Equatable {
  final String email;
  final String password;

  const Params({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class Login implements UseCase<User, Params> {
  final AuthenticationRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.login(
        email: params.email, password: params.password);
  }
}
