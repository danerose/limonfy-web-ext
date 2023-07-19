class DateLUtils {
  static String leftDays(
    String date,
  ) {
    final today = DateTime.now().toLocal();
    final expire = DateTime.parse(date).toLocal();
    final left = expire.difference(today);
    return left.inDays.toString();
  }
}
