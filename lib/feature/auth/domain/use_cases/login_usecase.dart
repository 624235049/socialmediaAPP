import '../entities/user_entity.dart';
import '../repositories/firebase_repository.dart';

class LoginUseCase {
  final FirebaseAuthRepository repository;

  LoginUseCase({required this.repository});

  Future<void> login(UserEntity user) {
    return repository.login(user);
  }
}
