class PasswordValidator {
  static String validatePassword(String password) {
    String errorMessage = '';

    // Password length greater than 6
    if (password.length < 6) {
      errorMessage += '• Password must be longer than 6 characters.\n';
    }
    // Contains at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      errorMessage += '• Password must contain a lowercase letter.\n';
    }
    // Contains at least one special character
    if (!RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(password)) {
      errorMessage += '• Password must contain a special character.';
    }

    return errorMessage;
  }
}
