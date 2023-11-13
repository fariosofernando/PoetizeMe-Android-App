class AuthorModel {
  final String id, username, biography;
  final String? email, profilePhoto;

  AuthorModel({
    required this.id,
    required this.username,
    required this.biography,
    this.email,
    this.profilePhoto,
  });

  static AuthorModel fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json["id"],
      username: json["username"],
      biography: json["biography"],
      email: json["email"],
      profilePhoto: json["profilePhoto"],
    );
  }
}
