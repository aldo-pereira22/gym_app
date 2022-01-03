class User {
  String? name;
  String? email;
  String? password;
  bool? keepOn;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.keepOn});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['keepOn'] = keepOn;
    return data;
  }

  @override
  String toString() {
    return "Name: " +
        name! +
        "\nE-mail: " +
        email! +
        "\nPassword: " +
        password!;
  }
}
