part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostSuccess extends PostState {
  @override
  List<Object> get props => [];
}

class PostFailure extends PostState {
  @override
  List<Object> get props => [];
}