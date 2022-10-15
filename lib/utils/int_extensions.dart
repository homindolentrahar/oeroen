extension IntExtensions on int {
  String formatTimer() {
    final minutes = this >= 60 ? this ~/ 60 : 0;
    final seconds = this >= 60 ? this % 60 : this;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
