import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_clean_architecture/features/authentication/domain/entities/user.dart';
import 'package:login_clean_architecture/features/authentication/domain/useCases/login.dart';
import 'package:login_clean_architecture/features/authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late Login useCase;
  late MockAuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();

    when(() => authenticationRepository.login(
            email: 'mockEmail', password: 'mockPassword'))
        .thenAnswer((_) async => const Right(User(authToken: 'mockAuthToken')));

    useCase = Login(authenticationRepository);
  });

  test('it should get the token when authenticated successfully', () async {
    final result = await useCase(email: 'mockEmail', password: 'mockPassword');
    expect(result, const Right(User(authToken: 'mockAuthToken')));
    verify(() => authenticationRepository.login(
        email: 'mockEmail', password: 'mockPassword')).called(1);
  });
}
