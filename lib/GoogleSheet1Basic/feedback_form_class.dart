class FeedbackFromModel {
  final String name;
  final String mobile;
  final String email;
  final String feedback;

  FeedbackFromModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.feedback,
  });

  factory FeedbackFromModel.fromJson(Map<String, dynamic> json) =>
      FeedbackFromModel(
        name: json['name'],
        mobile: json['mobile'],
        email: json['email'],
        feedback: json['feedback'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'mobile': mobile,
        'feedback': feedback,
      };
}
