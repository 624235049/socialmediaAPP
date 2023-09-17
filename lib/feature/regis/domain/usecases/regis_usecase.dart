
import 'package:socialMediaApp/feature/auth/domain/entities/user_entity.dart';
import 'package:socialMediaApp/feature/regis/domain/repositories/firebase_repository.dart';

class RegisUseCase {
  final FirebaseRepository repository;

  RegisUseCase({required this.repository});

  Future<void> register(UserEntity user) {
    return repository.register(user);
  }

}
