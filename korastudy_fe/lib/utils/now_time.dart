class NowTime {
  String getDate() {
    DateTime now = DateTime.now();
    return "${now.year}-${now.month}-${now.day}";
  }
}
