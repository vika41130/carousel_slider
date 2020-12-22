class LoginModel {
  String email;
  String password;

  bool checkEmail() {
    return email != null && email.isNotEmpty;
  }

  bool checkPassword() {
    return password != null && password.isNotEmpty;
  }

  bool checkValidate() {
    return email != null && email.isNotEmpty && password != null && password.isNotEmpty;
  }
}