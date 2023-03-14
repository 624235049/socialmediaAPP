import 'package:mfecinternship/feature/auth/domain/entities/user_entity.dart';



abstract class FirebaseRemoteDataSourceHome {

  Stream<List<UserEntity>> getAllUsers();

}
