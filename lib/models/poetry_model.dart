import 'author_model.dart';
import 'like_model.dart';
import 'tag_model.dart';

class PoetryModel {
  final String id, title, content;
  final List<TagModel> tags;
  final AuthorModel author;
  final List<LikeModel> likes;

  PoetryModel({
    required this.id,
    required this.title,
    required this.content,
    required this.tags,
    required this.author,
    required this.likes,
  });

  factory PoetryModel.fromJson(Map<String, dynamic> json) {
    return PoetryModel(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      tags: TagModel.fromJsonList(json["tags"]),
      author: AuthorModel.fromJson(json["author"]),
      likes: LikeModel.fromJsonList(json["likes"]),
    );
  }
}
