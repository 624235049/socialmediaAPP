import '../repositories/firebase_repository.dart';

class IsLoginUseCase {
  final FirebaseAuthRepository repository;

  IsLoginUseCase({required this.repository});

  Future<bool> isLogin() async {
    return repository.isLogin();
  }
}
