import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? phoneKey;
  final int? age;
  final String? gender;
  final String? photo;
  final bool? isNotifiy;
  final String? role;
  final bool? hasAddresses;
  final String? address;

  const User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.phoneKey,
    this.age,
    this.gender,
    this.photo,
    this.isNotifiy,
    this.role,
    this.hasAddresses,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        phoneKey: json['phone_key'] as String?,
        age: json['age'] as int?,
        gender: json['gender'] as String?,
        photo: json['photo'] as String?,
        isNotifiy: json['is_notifiy'] as bool?,
        role: json['role'] as String?,
        hasAddresses: json['hasAddresses'] as bool?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'phone_key': phoneKey,
        'age': age,
        'gender': gender,
        'photo': photo,
        'is_notifiy': isNotifiy,
        'role': role,
        'hasAddresses': hasAddresses,
        'address': address,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      phoneKey,
      age,
      gender,
      photo,
      isNotifiy,
      role,
      hasAddresses,
      address,
    ];
  }
}
