
import 'package:socialMediaApp/feature/regis/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCase {
  final FirebaseRepository repository;

  GetCurrentUserIdUseCase({required this.repository});

  Future<String> getCurrentUserId() {
    return repository.getCurrentUserId();
  }
}
