class LikeModel {
  final String id, poetryId, authorId;
  LikeModel({
    required this.id,
    required this.poetryId,
    required this.authorId,
  });

  static List<LikeModel> fromJsonList(List<dynamic> jsonList) {
    List<LikeModel> likes = [];
    for (var like in jsonList) {
      likes.add(
        LikeModel(
          id: like["id"],
          poetryId: like["poetryId"],
          authorId: like["authorId"],
        ),
      );
    }
    return likes;
  }
}
