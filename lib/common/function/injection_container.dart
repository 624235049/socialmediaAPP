import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mfecinternship/feature/regis/cubit/credential/credential_cubit.dart';
import 'package:mfecinternship/feature/regis/data/remote_data_source/firebase_remote_data_sourcce_impl.dart';
import 'package:mfecinternship/feature/regis/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:mfecinternship/feature/regis/data/repositories/firebase_repository_impl.dart';
import 'package:mfecinternship/feature/regis/domain/repositories/firebase_repository.dart';
import 'package:mfecinternship/feature/regis/domain/usecases/get_current_userId_usecase.dart';
import 'package:mfecinternship/feature/regis/domain/usecases/get_current_user_usecase.dart';
import 'package:mfecinternship/feature/regis/domain/usecases/regis_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc

  sl.registerSingleton(FirebaseFirestore.instance);
  sl.registerFactory<CredentialCubit>(
    () => CredentialCubit(
        getCurrentUserUseCase: sl.call(),
        getCurrentUserIdUseCase: sl.call(),
        regisUseCase: sl.call()),
  );
  //credential cubit usecase
  sl.registerLazySingleton(
      () => GetCurrentUserIdUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<RegisUseCase>(
      () => RegisUseCase(repository: sl.call()));

  //Repositories
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  //Remote DataSource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(firestore: sl.call(), auth: sl.call()));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
