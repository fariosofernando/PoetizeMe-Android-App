class TagModel {
  final String name;

  TagModel(this.name);

  static List<TagModel> fromJsonList(List<dynamic> jsonList) {
    List<TagModel> tags = [];
    for (var tag in jsonList) {
      tags.add(TagModel(tag));
    }
    return tags;
  }

  static List<String> toJsonList(List<TagModel> model) {
    List<String> tags = [];

    for (var tag in model) {
      tags.add(tag.name);
    }
    return tags;
  }
}
