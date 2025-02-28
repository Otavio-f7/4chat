import 'dart:io';

enum AuthyMode{ signup, login}

class AuthFormData{
  String name = '';
  String email = '';
  String password = '';
  File? image;

  AuthyMode _mode = AuthyMode.login;

  bool get isLogin{
    return _mode == AuthyMode.login;
  }

  bool get isSignup{
    return _mode == AuthyMode.signup;
  }

  void toggleAuthMode(){
    _mode = isLogin ? AuthyMode.signup : AuthyMode.login;
  }

}