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

  Post({required this.name, required this.time, required this.post});
}