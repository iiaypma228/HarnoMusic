extension DurationExtensions on Duration? {
  String get totalDuration {
    if (this == null) {
      return "0:00";
    } else {
      final String seconds = this!.inSeconds % 60 < 10
          ? "0${this!.inSeconds % 60}"
          : (this!.inSeconds % 60).toString();
      final String minutes = this!.inMinutes.toString();

      return "$minutes:$seconds";
    }
  }
}
