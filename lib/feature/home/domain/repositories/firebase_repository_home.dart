






import 'package:socialMediaApp/feature/home/domain/entities/post_entity.dart';

import '../../../auth/domain/entities/user_entity.dart';

abstract class FirebaseRepositoryHome {


  Stream<List<UserEntity>> getAllUsers();

  Future<void> createPost(PostEntity postEntity);

  Stream<List<PostEntity>> getAllPosts();

}