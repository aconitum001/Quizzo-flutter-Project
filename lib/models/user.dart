class User {
  String userName;
  int score;

  User({
    required this.userName,
    required this.score,
  });

  factory User.fromjson(jsonData) {
    return User(
      userName: jsonData["username"],
      score: jsonData["score"],
    );
  }
  @override
  String toString() {
    return 'User: { userName: $userName, score: $score }';
  }
}
