class Reel {
  int id;
  String username;
  String userImg;
  String contentImg;
  String content;
  String musicName;
  String musicOwner;
  String musicImg;
  String likesCount;
  String commentCount;
  bool isFollowed;

  Reel({
    required this.id,
    required this.username,
    required this.userImg,
    required this.contentImg,
    required this.content,
    required this.musicName,
    required this.musicOwner,
    required this.musicImg,
    required this.likesCount,
    required this.commentCount,
    required this.isFollowed,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'userImg': userImg,
      'contentImg': contentImg,
      'content': content,
      'musicname': musicName,
      'musicOwner': musicOwner,
      'musicImg': musicImg,
      'likesCount': likesCount,
      'commentCount': commentCount,
      'isFollowed': isFollowed,
    };
  }

  factory Reel.fromJson(Map<String, dynamic> json) {
    return Reel(
      id: json['id'] as int,
      username: json['username'] as String,
      userImg: json['userImg'] as String,
      contentImg: json['contentImg'] as String,
      content: json['content'] as String,
      musicName: json['musicname'] as String,
      musicOwner: json['musicOwner'] as String,
      musicImg: json['musicImg'] as String,
      likesCount: json['likesCount'] as String,
      commentCount: json['commentCount'] as String,
      isFollowed: json['isFollowed'] as bool,
    );
  }
}
