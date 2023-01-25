import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:login_clean_architecture/features/authentication/data/models/user_model.dart';
import 'package:login_clean_architecture/features/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const expectedUserModel = UserModel(authToken: 'testToken');

  test('should be a subclass of user', () {
    expect(expectedUserModel, isA<User>());
  });

  group('fromJSON', () {
    test('should return a valid model', () {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('login_fixture.json'));
      final result = UserModel.fromJson(jsonMap);
      expect(result, expectedUserModel);
    });
  });

  group('toJSON', () {
    test('should return a JSON map containing the proper data', () async {
      final expected = {'authToken': 'testToken'};

      final result = expectedUserModel.toJson();
      expect(result, expected);
    });
  });
}
