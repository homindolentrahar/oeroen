extension StringExtensions on String {
  String formatObscurePhone() {
    return replaceRange(3, 9, "*******");
  }

  bool parseBool() {
    if (toLowerCase() == "true") {
      return true;
    } else if (toLowerCase() == "false") {
      return false;
    } else {
      return false;
    }
  }
}
