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

 factory UserModel.fromJson(String uid, Map<String, dynamic> jsonData) {
  return UserModel(
    uid: uid, 
    name: (jsonData['name'] ?? '').toString(),
    email: (jsonData['email'] ?? '').toString(),
    image: jsonData['photo']?.toString(),
  );
}

}
