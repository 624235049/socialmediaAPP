import 'package:equatable/equatable.dart';


class PostEntity extends Equatable {
  final String? uid;
  final String? datetime;
  final List<String>? postImages;
  final String? postContent;
  final List<String>? likedUserIds;

  PostEntity({
    this.uid,
    this.datetime,
    this.postImages,
    this.postContent,
    this.likedUserIds,
  });

  @override
  List<Object?> get props => [
    uid,
    datetime,
    postImages,
    postContent,
    likedUserIds,
  ];
}