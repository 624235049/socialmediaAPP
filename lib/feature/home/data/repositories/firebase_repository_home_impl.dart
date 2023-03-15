
import '../../../auth/domain/entities/user_entity.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/firebase_repository_home.dart';
import '../remote_data_source/firebase_remote_data_source_home.dart';

class FirebaseRepositoryHomeImpl implements FirebaseRepositoryHome{

  final FirebaseRemoteDataSourceHome remoteDataSourceHome;

  FirebaseRepositoryHomeImpl({required this.remoteDataSourceHome});

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSourceHome.getAllUsers();

  @override
  Future<void> createPost(PostEntity postEntity) => remoteDataSourceHome.createPost(postEntity);


}