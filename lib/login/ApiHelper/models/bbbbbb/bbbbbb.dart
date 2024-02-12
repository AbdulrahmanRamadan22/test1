import 'package:equatable/equatable.dart';

import 'data.dart';

class Bbbbbb extends Equatable {
  final Data? data;
  final String? message;
  final bool? status;

  const Bbbbbb({this.data, this.message, this.status});

  factory Bbbbbb.fromJson(Map<String, dynamic> json) => Bbbbbb(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'status': status,
      };

  @override
  List<Object?> get props => [data, message, status];
}
