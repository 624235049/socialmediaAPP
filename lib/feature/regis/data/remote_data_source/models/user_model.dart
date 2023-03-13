import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mfecinternship/feature/regis/domain/entities/user_entity.dart';

class UserModel extends UserEntity {


  UserModel({
    final String? uid,
    final String? fullName,
    final String? gender,
    final String? nickName,
    final String? birthday,
    final String? email,
    final String? phone,
    final String? skill,
    final String? expect,
    final String? password,
    final String? imageUrl,
    final String? position,}) : super(
    uid: uid,
    fullName: fullName,
    gender: gender,
    nickName: nickName,
    birthday: birthday,
    email: email,
    phone: phone,
    skill: skill,
    expect: expect,
    password: password,
    imageUrl: imageUrl,
    position: position,
  );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot){
    return UserModel(
      uid: snapshot.get('uid'),
      fullName: snapshot.get('fullName'),
      gender: snapshot.get('gender'),
      nickName: snapshot.get('nickName'),
      birthday: snapshot.get('birthday'),
      email: snapshot.get('email'),
      phone: snapshot.get('phone'),
      skill: snapshot.get('skill'),
      expect: snapshot.get('expect'),
      password: snapshot.get('password'),
      imageUrl: snapshot.get('imageUrl'),
      position: snapshot.get('position'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "datetime": datetime,
      "fullName": fullName,
      "gender": gender,
      "nickName": nickName,
      "birthday": birthday,
      "email": email,
      "phone": phone,
      "skill": skill,
      "expect": expect,
      "password": password,
      "imageUrl": imageUrl,
      "position": position,
    };
  }

}