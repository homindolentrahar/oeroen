extension StringExtensions on String {
  String formatObscurePhone() {
    return replaceRange(3, 9, "*******");
  }
}
