
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mfecinternship/common/model/user_models.dart';
import 'package:mfecinternship/feature/auth/domain/entities/user_entity.dart';
import 'package:mfecinternship/feature/home/domain/usecases/get_all_users_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUseCase getAllUsersUseCase;

  UserCubit({required this.getAllUsersUseCase}) : super(UserInitial());

  Future<void> getUsers() async {
    try {
      getAllUsersUseCase.getAllUsers().listen((listAllUsers) {

        emit(UserLoaded(users: listAllUsers));
      });

    } on SocketException catch (_) {

      emit(UserFailure());
    } catch (_) {

      emit(UserFailure());
    }
  }

  // Future<void> getUsersWhereUid(String uid) async {
  //   try {
  //     getAllUsersUseCase.getAllUsers().map((listUsers) {
  //       return listUsers.where((user) => user.uid == uid).toList();
  //     }).listen((filteredUsers) {
  //       emit(UserLoaded(users: filteredUsers));
  //     });
  //   } on SocketException catch (_) {
  //     emit(UserFailure());
  //   } catch (_) {
  //     emit(UserFailure());
  //   }
  }







