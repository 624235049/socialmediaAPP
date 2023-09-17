
import 'package:socialMediaApp/feature/auth/domain/entities/user_entity.dart';

import '../../domain/entities/post_entity.dart';



abstract class FirebaseRemoteDataSourceHome {

  Stream<List<UserEntity>> getAllUsers();

  Future<void> createPost(PostEntity postEntity);

  Stream<List<PostEntity>> getAllPosts();

}
