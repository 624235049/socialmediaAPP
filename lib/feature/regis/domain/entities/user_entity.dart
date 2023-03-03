import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? datetime;
  final String? fullName;
  final String? gender;
  final String? nickName;
  final String? birthday;
  final String? email;
  final String? phone;
  final String? skill;
  final String? expect;
  final String? password;
  final String? imageUrl;
  final String? position;

  UserEntity(
      this.datetime,
      this.fullName,
      this.gender,
      this.nickName,
      this.birthday,
      this.email,
      this.phone,
      this.skill,
      this.expect,
      this.password,
      this.imageUrl,
      this.position);

  @override
  List<Object?> get props => [
        datetime,
        fullName,
        gender,
        nickName,
        birthday,
        email,
        phone,
        skill,
        expect,
        password,
        imageUrl,
        position
      ];
}
