class TextInputValidators {
  static String? nameValidation(String value) {
    if (value.trim().isEmpty) {
      return "Name filed is required";
    } else {
      return null;
    }
  }

  static String? weightValidation(String value) {
    String pattern = r'^\d+(\.\d{1,3})?$';
    final RegExp regExp = RegExp(pattern);

    if (value.trim().isEmpty) {
      return "Weight filed is required";
    } else if (!regExp.hasMatch(value)) {
      return "Numbers only";
    } else {
      return null;
    }
  }

  static String? addressValidation(String value) {
    if (value.trim().isEmpty) {
      return "Address is required";
    } else {
      return null;
    }
  }

  static String? phoneValidation(String value) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final RegExp regExp = RegExp(pattern);
    if (value.trim().isEmpty) {
      return "Phone number is required";
    } else if (!regExp.hasMatch(value)) {
      return "Phone number is not valid";
    }
    return null;
  }
}
