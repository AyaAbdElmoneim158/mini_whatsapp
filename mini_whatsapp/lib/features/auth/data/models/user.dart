class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  // Adds the copyWith method
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
