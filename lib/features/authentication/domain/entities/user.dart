import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String authToken;

  const User({required this.authToken});

  @override
  List<Object?> get props => [authToken];
}
