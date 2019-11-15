class Token {
  String token, refreshToken;

  Token({
    this.token,
    this.refreshToken,
  });

  Token.fromMap(Map<String, dynamic> map) {
    token = map['token'];
    refreshToken = map['refresh_token'];
  }
}
