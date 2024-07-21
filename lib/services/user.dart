class User {
  final String mberId;
  final int mberPassword;

  User({
    required this.mberId,
    required this.mberPassword,
  });

  static User fromJson(json) => User(
        mberId: json['mberId'],
        mberPassword: json['mberPassword'],
      );
}
