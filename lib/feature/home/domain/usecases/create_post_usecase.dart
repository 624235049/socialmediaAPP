



import '../entities/post_entity.dart';
import '../repositories/firebase_repository_home.dart';

class CreatePostUseCase {

  final FirebaseRepositoryHome repositoryHome;
  CreatePostUseCase({required this.repositoryHome});


  Future<void> createPost(PostEntity postEntity) {
    return repositoryHome.createPost(postEntity);
  }



}