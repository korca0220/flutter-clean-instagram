class Validations {
  static String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  static String validatePassword(String value) {
    if (value == null || value.length < 4) {
      return 'Enter a valid password';
    } else
      return null;
  }

  static String validateDisplayName(String value) {
    if (value == null || value.length < 4) {
      return 'Enter a valid displayName';
    } else if (value.length > 20) {
      return 'Displayname is less than 20 characters long';
    }
    return null;
  }
}
