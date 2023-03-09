

import '../../domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource {

  Future<void> register(UserEntity user);

  Future<void> getCreateCurrentUser(UserEntity user);

  Future<String> getCreateCurrentUserId();

}