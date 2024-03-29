
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialMediaApp/feature/auth/domain/entities/user_entity.dart';

import 'package:socialMediaApp/feature/home/domain/usecases/get_all_users_usecase.dart';

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

  // Stream<UserState> getUserById(String userId) async* {
  //   try {
  //     final userStream = getAllUsersUseCase.getAllUsers().map((listAllUsers) {
  //       final user = listAllUsers.where((user) => user.uid == userId).first;
  //       return UserLoaded(users: [user]);
  //     });
  //     yield* userStream;
  //   } on SocketException catch (_) {
  //     yield UserFailure();
  //   } catch (_) {
  //     yield UserFailure();
  //   }
  // }

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







