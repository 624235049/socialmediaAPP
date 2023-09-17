import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialMediaApp/common/model/user_models.dart';


import '../../domain/entities/user_entity.dart';
import 'firebase_remote_data_source.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FirebaseRemoteDataSourceImpl({required this.firestore, required this.auth});

  @override
  Future<void> register(UserEntity user) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
    } catch (error) {
      print("Failed to create user: $error");
      rethrow;
    }
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = firestore.collection("user");
    final uid = await getCurrentUserId();

    final newUser = UserModel(
        uid: user.uid,
        fullName: user.fullName,
        nickName: user.nickName,
        gender: user.gender,
        birthday: user.birthday,
        email: user.email,
        phone: user.phone,
        skill: user.skill,
        expect: user.expect,
        position: user.position,
        imageUrl: user.imageUrl)
        .toDocument();

    try {
      final userDoc = await userCollection.doc(uid).get();
      if (!userDoc.exists) {
        await userCollection.doc(uid).set(newUser);
        return;
      } else {
        await userCollection.doc(uid).update(newUser);
        print("user already exists");
        return;
      }
    } catch (error) {
      print("Failed to create user: $error");

    }
  }

  @override
  Future<String> getCurrentUserId() async => auth.currentUser!.uid;
}