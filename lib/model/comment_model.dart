class Comment {
  int? postId;
  String? avatarImageUrl;
  String? name;
  String? time;
  String? comment;

  Comment({
    this.postId,
    this.avatarImageUrl,
    this.name,
    this.time,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'post_id': postId,
      'avatar_image_url': avatarImageUrl,
      'name': name,
      'time': time,
      'comment': comment,
    };
  }

  static Comment fromMap(Map<String, dynamic> map) {
    return Comment(
      postId: map['post_id'],
      avatarImageUrl: map['avatar_image_url'],
      name: map['name'],
      time: map['time'],
      comment: map['comment'],
    );
  }
}