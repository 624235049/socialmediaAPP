import '../entities/user_entity.dart';

abstract class FirebaseAuthRepository {
  Future<bool> isLogin();

  Future<void> login(UserEntity user);

  Future<void> logOut();

  Future<String> getCurrentUId();

  Future<void> googleAuth();
}
