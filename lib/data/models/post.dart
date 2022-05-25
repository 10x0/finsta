class Post {
  final String id;
  final Author user;
  final String file;
  final String description;
  final int likesCount;
  final int commentsCount;

  Post({
    required this.id,
    required this.user,
    required this.file,
    required this.description,
    required this.likesCount,
    required this.commentsCount,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['_id'] as String,
      user: Author.fromJson(map['user']),
      file: map['file'] as String,
      description: map['description'] as String,
      likesCount: map['likesCount'] as int,
      commentsCount: map['commentsCount'] as int,
    );
  }
}

class Author {
  final String id;
  final String username;

  Author({required this.id, required this.username});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json['_id'] as String,
        username: json['username'] as String,
      );
}
