


import 'package:socialMediaApp/feature/home/domain/repositories/firebase_repository_home.dart';

import '../../../auth/domain/entities/user_entity.dart';


class GetAllUsersUseCase {

  final FirebaseRepositoryHome repositoryHome;
  GetAllUsersUseCase({required this.repositoryHome});


  Stream<List<UserEntity>>getAllUsers() {
    return repositoryHome.getAllUsers();
  }



}