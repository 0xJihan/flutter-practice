class Post{




  final int userId;
  final int? id;
  final String title;
  final String body;


  Post({
    required this.userId,
     this.id,
    required this.title,
    required this.body
});


  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    userId: json['userId'],
    title: json['title'],
    body: json['body'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'body': body,
  };


}