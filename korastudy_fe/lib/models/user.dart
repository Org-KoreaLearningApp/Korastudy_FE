class User {
  final int id;
  final String username;
  final String email;
  final String? pass;
  final String image;
  final DateTime create_at;
  final DateTime update_at;
  // final String? token;

  User(
      {required this.id,
      required this.username,
      required this.email,
      this.pass,
      required this.image,
      required this.create_at,
      required this.update_at});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
      create_at: json['create_at'],
      update_at: json['update_at'],
    );
  }

  Map<String, dynamic> toLoginJSON() {
    return {
      'email': email,
      'pass': pass,
    };
  }

  Map<String, dynamic> toRegisterJSON() {
    return {
      'email': email,
      'username': username,
      'pass': pass,
    };
  }
}
