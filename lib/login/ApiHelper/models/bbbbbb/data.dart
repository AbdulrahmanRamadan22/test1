import 'package:equatable/equatable.dart';

import 'user.dart';

class Data extends Equatable {
  final User? user;
  final String? type;
  final String? token;

  const Data({this.user, this.type, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        type: json['type'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'type': type,
        'token': token,
      };

  @override
  List<Object?> get props => [user, type, token];
}
