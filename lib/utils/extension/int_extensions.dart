extension IntExtensions on int {
  String formatTimer() {
    final minutes = this >= 60 ? this ~/ 60 : 0;
    final seconds = this >= 60 ? this % 60 : this;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  String getDayName() {
    if (this == 1) {
      return "Senin";
    } else if (this == 2) {
      return "Selasa";
    } else if (this == 3) {
      return "Rabu";
    } else if (this == 4) {
      return "Kamis";
    } else if (this == 5) {
      return "Jumat";
    } else if (this == 6) {
      return "Sabtu";
    } else if (this == 7) {
      return "Minggu";
    } else {
      return "Tidak ada Hari";
    }
  }
}
