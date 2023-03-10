import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mfecinternship/feature/auth/domain/use_cases/login_usecase.dart';
import 'package:mfecinternship/feature/auth/domain/use_cases/logout_usecase.dart';

import '../../domain/entities/user_entity.dart';

part 'credential_auth_state.dart';

class CredentialAuthCubit extends Cubit<CredentialAuthState> {

  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  CredentialAuthCubit({required this.loginUseCase,required this.logoutUseCase}) : super(CredentialAuthInitial());

  Future<void> loginSubmit({
    required String email,
    required String password,
  }) async {
    emit(CredentialAuthLoading());
    try {
      await loginUseCase.login(UserEntity(email: email, password: password));
      emit(CredentialAuthSuccess());
    } on SocketException catch (_) {
      emit(CredentialAuthFailure());
    } catch (_) {
      emit(CredentialAuthFailure());
    }
  }

}
