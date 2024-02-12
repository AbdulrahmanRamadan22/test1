class LoginResponse {
  final bool firstLogin;
  final bool isApple;
  final String message;
  final bool status;

  LoginResponse({
    required this.firstLogin,
    required this.isApple,
    required this.message,
    required this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      firstLogin: json['data']['first_login'] ?? false,
      isApple: json['data']['is_apple'] ?? false,
      message: json['message'] ?? '',
      status: json['status'] ?? false,
    );
  }
}
