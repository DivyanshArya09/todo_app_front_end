enum AuthTermsAndConditionType {
  signUp,
  login,
}

extension AuthTermsAndConditionEnumExtension on AuthTermsAndConditionType {
  String get text {
    switch (this) {
      case AuthTermsAndConditionType.signUp:
        return 'By signing in, you agree to our ';
      case AuthTermsAndConditionType.login:
        return 'By signing in, you agree to our ';
    }
  }
}
