class Post {
  int id;
  String name;
  String profileImg;
  String postImg;
  String caption;
  bool isLoved;
  String commentCount;
  dynamic likedBy;
  String timeAgo;
  String likesCount;

  Post({
    required this.id,
    required this.name,
    required this.profileImg,
    required this.postImg,
    required this.caption,
    required this.isLoved,
    required this.commentCount,
    required this.likedBy,
    required this.timeAgo,
    required this.likesCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'profileImg': profileImg,
      'postImg': postImg,
      'caption': caption,
      'isLoved': isLoved,
      'commentCount': commentCount,
      'likedBy': likedBy,
      'timeAgo': timeAgo,
      'likescount': likesCount,
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      name: json['name'] as String,
      profileImg: json['profileImg'] as String,
      postImg: json['postImg'] as String,
      caption: json['caption'] as String,
      isLoved: json['isLoved'] as bool,
      commentCount: json['commentCount'] as String,
      likedBy: json['likedBy'] as dynamic,
      timeAgo: json['timeAgo'] as String,
      likesCount: json['likescount'] as String,
    );
  }
}
