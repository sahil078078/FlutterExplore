// ignore_for_file: sdk_version_since

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
        id: int.tryParse(json[UserFields.id] ?? "0"),
        name: json[UserFields.name],
        email: json[UserFields.email],
        isBeginner: bool.tryParse(json[UserFields.isBeginner]) ?? false,
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
