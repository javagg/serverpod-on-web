import 'dart:async';

class HttpRequest {}

class WebSocket implements Stream<dynamic /*String|List<int>*/ >, StreamSink<dynamic /*String|List<int>*/ > {
  // Implementing Stream methods
  @override
  StreamSubscription<dynamic> listen(void Function(dynamic event)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> any(bool Function(dynamic element) test) {
    throw UnimplementedError();
  }

  @override
  Stream<T> asBroadcastStream({void Function(StreamSubscription<dynamic> subscription)? onListen, void Function(StreamSubscription<dynamic> subscription)? onCancel}) {
    throw UnimplementedError();
  }

  // Implementing other Stream methods...

  // Implementing StreamSink methods
  @override
  void add(dynamic data) {
    throw UnimplementedError();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    throw UnimplementedError();
  }

  @override
  Future addStream(Stream<dynamic> stream) {
    throw UnimplementedError();
  }

  @override
  Future close() {
    throw UnimplementedError();
  }

  @override
  Future get done {
    throw UnimplementedError();
  }
}
