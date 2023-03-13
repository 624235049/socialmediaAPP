import 'package:mfecinternship/feature/regis/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:mfecinternship/feature/regis/domain/entities/user_entity.dart';
import 'package:mfecinternship/feature/regis/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  @override
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> register(UserEntity user) async =>
      remoteDataSource.register(user);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await  remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUserId() async => await remoteDataSource.getCurrentUserId();


}
