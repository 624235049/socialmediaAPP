import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialMediaApp/feature/auth/domain/entities/user_entity.dart';

import 'firebase_remote_data_sources_auth.dart';

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;

  FirebaseAuthRemoteDataSourceImpl({required this.fireStore,required this.auth,} );

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  // @override
  // Future<void> googleAuth() {
  //   throw UnimplementedError();
  // }

  @override
  Future<bool> isLogin() async => auth.currentUser?.uid != null;

  @override
  Future<void> login(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
