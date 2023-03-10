import '../repositories/firebase_repository.dart';

class GetCurrentUidUseCaseAuth {
  final FirebaseAuthRepository repository;

  GetCurrentUidUseCaseAuth({required this.repository});

  Future<String> getCurrentUid() async {
    return repository.getCurrentUId();
  }
}
