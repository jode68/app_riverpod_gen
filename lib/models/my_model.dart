class MyModel {
  String id;
  String name;
  String email;
  String password;
  String image;

  MyModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'image': image,
    };
  }

  factory MyModel.fromJson(Map<String, dynamic> map) {
    return MyModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
