import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mfecinternship/feature/regis/model/registerModel.dart';
import 'package:mfecinternship/model/userModel.dart';

class registerViewModel {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  late UserModelT user;
  late String uri;

  Future<void> register({
   required RegisterModel regisData
  }) async {
      try{
        await _firebaseAuth.createUserWithEmailAndPassword(email: regisData.email, password: regisData.password).then((value) =>
        user = UserModelT(uid: value.user!.uid,
          expect: regisData.expect,
          phoneNumber: regisData.phoneNumber,
          email: regisData.email, nickname: regisData.nickname,
          fullName: regisData.fullName, birthDate: regisData.birthDate,
          skills: regisData.skills, positionOfInternship: regisData.positionOfInternship,
          gender: regisData.gender, imageUri: regisData.imageUri,)


        );
        createUser(userData: user);

      }on FirebaseAuthException catch (e){
        print(e);
      }

  }
  Future<void> createUser({
    required UserModelT userData
  }) async {
    await _fireStore.collection("user").doc(userData.uid).get().then((DocumentSnapshot documentSnapshot) {
        if(!documentSnapshot.exists){
          try {
            _fireStore.collection("user").doc(userData.uid).set(userData.toMap());
          }catch(e){
            print("Register Failed $e");
          }
        }
    });

  }
  Future<String> uploadImage({
      required File? image
  }) async {
    String imgName = DateTime.now().millisecondsSinceEpoch.toString();
    await _fireStorage.ref().child("image/$imgName.png").putFile(image!).then((p0) =>
      uri = p0.ref.fullPath);
    return uri;
  }


}