





import '../../../auth/domain/entities/user_entity.dart';

abstract class FirebaseRepositoryHome {


  Stream<List<UserEntity>> getAllUsers();


}