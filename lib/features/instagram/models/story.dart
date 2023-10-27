class Story {
  int id;
  String name;
  String image;

  Story({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
