
import 'package:mfecinternship/feature/regis/data/remote_data_source/firebase_remote_data_sourcce_impl.dart';
import 'package:mfecinternship/feature/regis/domain/entities/user_entity.dart';
import 'package:mfecinternship/feature/regis/domain/repositories/firebase_repository.dart';

import '../data/remote_data_source/firebase_remote_data_source.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{


  final FirebaseRemoteDataSource remoteDataSource;
  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> register(UserEntity user) async => remoteDataSource.register(user);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async => remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCreateCurrentUserId() async => remoteDataSource.getCreateCurrentUserId();

}




