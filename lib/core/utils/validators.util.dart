class ValidatorUtils {
  static T containsKey<T>(
    Map<String, dynamic>? json,
    String key,
    T value,
  ) {
    if (json != null && json.containsKey(key) && json[key] != null) {
      return json[key] as T;
    }
    {
      return value;
    }
  }
}
