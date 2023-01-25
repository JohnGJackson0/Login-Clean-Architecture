import '../../domain/entities/user.dart';

class UserModel extends User {
  final String authToken;

  const UserModel({required this.authToken}) : super(authToken: authToken);

  @override
  List<Object?> get props => [authToken];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(authToken: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'authToken': authToken};
  }
}
