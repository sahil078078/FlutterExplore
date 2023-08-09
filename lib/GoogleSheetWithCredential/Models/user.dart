class UserFields {
  static const String id = "ID";
  static const String name = "Name";
  static const String email = "Email";
  static const String isBeginner = "isBeginner";

  static List<String> getFields() => [id, name, email, isBeginner];
}

class User {
  final int? id;
  final String name, email;
  final bool isBeginner;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.isBeginner,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json[UserFields.id],
        name: json[UserFields.name],
        email: json[UserFields.email],
        isBeginner: json[UserFields.isBeginner],
      );
  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.isBeginner: isBeginner,
      };
  User copy({
    int? id,
    String? name,
    String? email,
    bool? isBeginner,
  }) =>
      User(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        isBeginner: isBeginner ?? this.isBeginner,
      );
}
