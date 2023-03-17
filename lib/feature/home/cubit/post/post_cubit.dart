import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mfecinternship/feature/home/domain/entities/post_entity.dart';
import 'package:mfecinternship/feature/home/domain/usecases/create_post_usecase.dart';
import 'package:mfecinternship/feature/home/domain/usecases/get_all_posts.dart';

import '../../domain/usecases/get_all_users_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final CreatePostUseCase createPostUseCase;
  final GetAllPostsUseCase getAllPostsUseCase;

  PostCubit({required this.createPostUseCase, required this.getAllUsersUseCase, required this.getAllPostsUseCase})
      : super(PostInitial());

  Future<void> submitCreatePost({required PostEntity postEntity}) async {
    emit(PostLoading());
    try {
      await createPostUseCase.createPost(postEntity);
      emit(PostSuccess());
    } on SocketException catch (_) {
      emit(PostFailure());
    } catch (_) {
      emit(PostFailure());
    }
  }

  Future<void> getPosts() async {
    try {
      getAllPostsUseCase.getAllPosts().listen((posts) {
        emit(PostLoaded(posts: posts));
      });

    } on SocketException catch (_) {

      emit(PostFailure());
    } catch (_) {

      emit(PostFailure());
    }
  }




}
