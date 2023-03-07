import 'package:mfecinternship/feature/regis/domain/entities/user_entity.dart';
import 'package:mfecinternship/feature/regis/domain/repositories/firebase_repository.dart';

class RegisUseCase {
  final FirebaseRepository repository;

  RegisUseCase({required this.repository});

  Future<void> register(UserEntity user) {
    return repository.register(user);
  }

  Future<void> getCreateCurrentUser(UserEntity user) {
    return repository.register(user);
  }

  Future<void> getCreateCurrentUserId() {
    return repository.getCreateCurrentUserId();
  }
}
