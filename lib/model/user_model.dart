class UserModel {
  final String name;
  final String? image;
  final String email;

  UserModel({required this.email,required this.name, required this.image});

  factory UserModel.fromJson(jsonData) {
    return UserModel(name: jsonData['name'], image: jsonData['photo'], email: jsonData['email']);
  }
}
