



import '../../../domain/entities/user_entity.dart';

abstract class FirebaseAuthRemoteDataSource {

  Future<void> login(UserEntity user);


  Future<bool> isLogin();

  Future<void> logout();

  Future<String> getCurrentUId();

}