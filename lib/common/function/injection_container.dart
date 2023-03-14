import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mfecinternship/feature/auth/cubit/credential/credential_auth_cubit.dart';
import 'package:mfecinternship/feature/auth/data/remote/data_sources_auth/firebase_remote_data_sources_auth.dart';
import 'package:mfecinternship/feature/auth/data/remote/data_sources_auth/firebase_remote_datasources_auth_Impl.dart';
import 'package:mfecinternship/feature/auth/data/repositories/firebase_repository_impl.dart';
import 'package:mfecinternship/feature/auth/domain/repositories/firebase_repository.dart';
import 'package:mfecinternship/feature/auth/domain/use_cases/is_login_usecase.dart';
import 'package:mfecinternship/feature/auth/domain/use_cases/login_usecase.dart';
import 'package:mfecinternship/feature/auth/domain/use_cases/logout_usecase.dart';
import 'package:mfecinternship/feature/home/cubit/user/user_cubit.dart';
import 'package:mfecinternship/feature/home/data/remote_data_source/firebase_remote_data_source_home.dart';
import 'package:mfecinternship/feature/home/data/remote_data_source/firebase_remote_data_source_impl_home.dart';
import 'package:mfecinternship/feature/home/data/repositories/firebase_repository_home_impl.dart';
import 'package:mfecinternship/feature/home/domain/repositories/firebase_repository_home.dart';
import 'package:mfecinternship/feature/home/domain/usecases/get_all_users_usecase.dart';
import 'package:mfecinternship/feature/regis/cubit/credential/credential_cubit.dart';
import 'package:mfecinternship/feature/regis/data/remote_data_source/firebase_remote_data_sourcce_impl.dart';
import 'package:mfecinternship/feature/regis/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:mfecinternship/feature/regis/data/repositories/firebase_repository_impl.dart';
import 'package:mfecinternship/feature/regis/domain/repositories/firebase_repository.dart';
import 'package:mfecinternship/feature/regis/domain/usecases/get_current_userId_usecase.dart';
import 'package:mfecinternship/feature/regis/domain/usecases/get_current_user_usecase.dart';
import 'package:mfecinternship/feature/regis/domain/usecases/regis_usecase.dart';

import '../../feature/auth/cubit/auth/auth_cubit.dart';
import '../../feature/auth/domain/use_cases/getcurrent_uid_usecase_auth.dart';

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

  sl.registerFactory<CredentialAuthCubit>(
    () =>
        CredentialAuthCubit(loginUseCase: sl.call(), logoutUseCase: sl.call()),
  );

  sl.registerFactory<AuthCubit>(() => AuthCubit(
        logoutUseCase: sl.call(),
        getCurrentUidUseCaseAuth: sl.call(),
        isLoginUseCase: sl.call(),
      ));

  sl.registerFactory<UserCubit>(
        () => UserCubit(
      getAllUsersUseCase: sl.call(),
    ),
  );
  //credential cubit usecase
  sl.registerLazySingleton(
      () => GetCurrentUserIdUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<RegisUseCase>(
      () => RegisUseCase(repository: sl.call()));

  sl.registerLazySingleton(
      () => GetCurrentUidUseCaseAuth(repository: sl.call()));
  sl.registerLazySingleton(() => LoginUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsLoginUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetAllUsersUseCase(repositoryHome: sl.call()));

  //Repositories
  sl.registerLazySingleton<FirebaseRepositoryHome>(() => FirebaseRepositoryHomeImpl(remoteDataSourceHome: sl.call()));
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<FirebaseAuthRepository>(
      () => FirebaseRepositoryAuthImpl(remoteDataSource: sl.call()));

  //Remote DataSource
  sl.registerLazySingleton<FirebaseRemoteDataSourceHome>(() => FirebaseRemoteDataSourceImplHome(firestore: sl.call(), auth: sl.call()));
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(firestore: sl.call(), auth: sl.call()));

  sl.registerLazySingleton<FirebaseAuthRemoteDataSource>(() =>
      FirebaseAuthRemoteDataSourceImpl(fireStore: sl.call(), auth: sl.call()));
  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
