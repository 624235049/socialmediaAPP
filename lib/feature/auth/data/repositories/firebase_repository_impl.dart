
import 'package:socialMediaApp/feature/auth/domain/entities/user_entity.dart';

import '../../domain/repositories/firebase_repository.dart';
import '../remote/data_sources_auth/firebase_remote_data_sources_auth.dart';

class FirebaseRepositoryAuthImpl implements FirebaseAuthRepository {
  final FirebaseAuthRemoteDataSource remoteDataSource;

  FirebaseRepositoryAuthImpl({required this.remoteDataSource});

  @override
  Future<String> getCurrentUId() async =>
      await remoteDataSource.getCurrentUId();

  @override
  Future<void> googleAuth() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isLogin() async => await remoteDataSource.isLogin();

  @override
  Future<void> logOut() async => await remoteDataSource.logout();

  @override
  Future<void> login(UserEntity user) async =>
      await remoteDataSource.login(user);
}
