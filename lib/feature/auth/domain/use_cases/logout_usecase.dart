import '../repositories/firebase_repository.dart';

class LogoutUseCase {
  final FirebaseAuthRepository repository;

  LogoutUseCase({required this.repository});

  Future<void> logout()async{
    return repository.logOut();
  }
}