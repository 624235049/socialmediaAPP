import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mfecinternship/feature/auth/domain/use_cases/is_login_usecase.dart';
import 'package:mfecinternship/feature/auth/domain/use_cases/logout_usecase.dart';

import '../../domain/use_cases/getcurrent_uid_usecase_auth.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsLoginUseCase isLoginUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUidUseCaseAuth getCurrentUidUseCaseAuth;

  AuthCubit(
      {required this.isLoginUseCase, required this.logoutUseCase, required this.getCurrentUidUseCaseAuth})
      : super(AuthInitial());


  Future<void> appStarted() async {
    try {
      bool isLogin = await isLoginUseCase.isLogin();
      print(isLogin);
      if (isLogin == true) {
        final uid = await getCurrentUidUseCaseAuth.getCurrentUid();

        emit(Authenticated(uid: uid));
      } else
        emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUidUseCaseAuth.getCurrentUid();
      print("user Id $uid");
      emit(Authenticated(uid: uid));
    } catch (_) {
      print("user Id null");
      emit(UnAuthenticated());
    }


    Future<void> loggedOut() async {
      try {
        await logoutUseCase.logout();
        emit(UnAuthenticated());
      } catch (_) {
        emit(UnAuthenticated());
      }
    }
  }
}