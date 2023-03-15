import '../../domain/entities/post_entity.dart';

class PostModel {
  final String? uid;
  final DateTime? datetime;
  final List<String>? postImages;
  final String? postContent;
  final List<String>? likedUserIds;

  PostModel({
    this.uid,
    this.datetime,
    this.postImages,
    this.postContent,
    this.likedUserIds,
  });

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      uid: entity.uid,
      datetime: DateTime.parse(entity.datetime!),
      postImages: entity.postImages,
      postContent: entity.postContent,
      likedUserIds: entity.likedUserIds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'datetime': datetime?.toIso8601String(),
      'postImages': postImages,
      'postContent': postContent,
      'likedUserIds': likedUserIds,
    };
  }
}