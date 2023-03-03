
class PostModel{
  final int id;
  final String userId;
  final String title;

  PostModel({required this.id, required this.userId, required this.title});

  factory PostModel.fromJson(Map<String,dynamic>json){
    return PostModel(id: json['id'], userId: json['userId'], title: json['title']);
  }
}