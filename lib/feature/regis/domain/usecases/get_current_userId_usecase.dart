import 'package:mfecinternship/feature/regis/domain/entities/user_entity.dart';
import 'package:mfecinternship/feature/regis/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCase {
  final FirebaseRepository repository;

  GetCurrentUserIdUseCase({required this.repository});

  Future<String> getCreateCurrentUserId() {
    return repository.getCreateCurrentUserId();
  }
}
