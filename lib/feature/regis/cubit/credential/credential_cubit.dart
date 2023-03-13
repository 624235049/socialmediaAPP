import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mfecinternship/feature/regis/domain/entities/user_entity.dart';
import '../../domain/usecases/get_current_userId_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/regis_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final RegisUseCase regisUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;

  CredentialCubit(
      {required this.getCurrentUserUseCase,
      required this.getCurrentUserIdUseCase,
      required this.regisUseCase})
      : super(CredentialInitial());

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await regisUseCase.register(user).then((value) async{
        await getCurrentUserUseCase.getCreateCurrentUser(user);
      });

      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
