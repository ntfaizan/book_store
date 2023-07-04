class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> mp) => Post(
        userId: mp['userId'],
        id: mp['id'],
        title: mp['title'],
        body: mp['body'],
      );
      
  // factory Post.fromJson(Map<String, dynamic> mp) {
  //   return Post(
  //     userId: mp['userId'],
  //     id: mp['id'],
  //     title: mp['title'],
  //     body: mp['body'],
  //   );
  // }
}
