import 'dart:convert';

class LoginModel {
  String name;
  String email;
  LoginModel({
    required this.name,
    required this.email,
  });

  LoginModel copyWith({
    String? name,
    String? email,
  }) {
    return LoginModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }


  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginModel(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
