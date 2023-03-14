import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mfecinternship/common/model/user_models.dart';
import 'package:mfecinternship/feature/auth/domain/entities/user_entity.dart';
import 'firebase_remote_data_source_home.dart';



class FirebaseRemoteDataSourceImplHome implements FirebaseRemoteDataSourceHome {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FirebaseRemoteDataSourceImplHome(
      {required this.firestore, required this.auth});



  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = firestore.collection("user");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserEntity(
          uid: e.id,
          datetime: e.get('datetime'),
          fullName: e.get('fullName'),
          gender: e.get('gender'),
          nickName: e.get('nickName'),
          birthday: e.get('birthday'),
          email: e.get('email'),
          phone: e.get('phone'),
          skill: e.get('skill'),
          expect: e.get('expect'),
          password: e.get('password'),
          imageUrl: e.get('imageUrl'),
          position: e.get('position'),
        )).toList());
  }
}