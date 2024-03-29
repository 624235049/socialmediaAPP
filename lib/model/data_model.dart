class Data {
  final String imageUrl;
  final String name;

  Data({
    required this.imageUrl,
    required this.name,
  });
}

class Post {
  final String name;
  final String time;
  final String post;
  final String image;

  Post({required this.name, required this.time, required this.post,required this.image});
}

class Comment {
  final int id;
  final String avatarImageUrl;
  final String name;
  final String time;
  final String comment;
  final List<Comment> replies;

  Comment({
    required this.id,
    required this.avatarImageUrl,
    required this.name,
    required this.time,
    required this.comment,
    required this.replies,
  });
}

class Friend {
  final String imageUrl;
  final String name;
  final String position;

  Friend({required this.imageUrl, required this.name, required this.position});
}