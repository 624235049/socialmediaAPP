import 'package:socialMediaApp/feature/home/domain/entities/post_entity.dart';

import '../repositories/firebase_repository_home.dart';

class GetAllPostsUseCase {
  final FirebaseRepositoryHome repositoryHome;

  GetAllPostsUseCase({required this.repositoryHome});

  Stream<List<PostEntity>> getAllPosts() {
    return repositoryHome.getAllPosts();
  }
}
