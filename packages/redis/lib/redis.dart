class RedisController {
  /// Removes all objects in the Redis cache, use with caution. Returns true if
  /// successful.
  Future<bool> clear() async {
    throw UnimplementedError();
  }

  /// Gets a [String] from the Redis cache. If there is no object matching the
  /// key, null is returned.
  Future<String?> get(String key) async {
    throw UnimplementedError();
  }

  /// Deletes an entry from the Redis cache. Returns true if successful.
  Future<bool> del(String key) async {
    throw UnimplementedError();
  }

  /// Sets a [String] in the Redis cache, which optionally expires.
  Future<bool> set(String key, String message, {Duration? lifetime}) async {
    throw UnimplementedError();
  }
}
