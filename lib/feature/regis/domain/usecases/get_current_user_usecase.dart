import 'package:mfecinternship/feature/regis/domain/entities/user_entity.dart';
import 'package:mfecinternship/feature/regis/domain/repositories/firebase_repository.dart';

class GetCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCurrentUserUseCase({required this.repository});

  Future<void> getCreateCurrentUser(UserEntity user) {
    return repository.getCreateCurrentUser(user);
  }
}
