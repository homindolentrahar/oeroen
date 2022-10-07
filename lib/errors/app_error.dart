class AppError implements Exception {
  final String code;
  final String message;

  AppError({required this.code, required this.message});

  @override
  String toString() {
    return "$code: $message";
  }
}
