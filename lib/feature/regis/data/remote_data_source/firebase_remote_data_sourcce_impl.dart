

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mfecinternship/feature/regis/data/remote_data_source/models/user_model.dart';


import '../../../../model/userModel.dart';
import '../../domain/entities/user_entity.dart';
import 'firebase_remote_data_source.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FirebaseRemoteDataSourceImpl({required this.firestore, required this.auth});

  @override
  Future<void> register(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = firestore.collection("user");
    final uid = await getCreateCurrentUserId();

    final newUser = UserModel(uid: user.uid,
        fullName: user.fullName,
        nickName: user.nickName,
        gender: user.gender,
        birthday: user.birthday,
        email: user.email,
        phone: user.phone,
        skill: user.skill,
        expect: user.expect,
        position: user.position,
        imageUrl: user.imageUrl).toDocument();

    userCollection.doc(uid).get().then((userDoc) {
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }
    });
  }

  @override
  Future<String> getCreateCurrentUserId() async => auth.currentUser!.uid;
}
