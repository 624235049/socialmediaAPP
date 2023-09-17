
import 'package:socialMediaApp/feature/auth/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<void> register(UserEntity user);

  Future<void> getCreateCurrentUser(UserEntity user);

  Future<String> getCurrentUserId();
}
