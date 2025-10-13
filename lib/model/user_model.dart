class UserModel {
  final String uid;
  final String name;
  final String? image;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.image,
  });

  factory UserModel.fromJson(String uid, jsonData) {
    return UserModel(
      uid: jsonData['uid'],
      name: jsonData['name'],
      image: jsonData['photo'],
      email: jsonData['email'],
    );
  }
}
