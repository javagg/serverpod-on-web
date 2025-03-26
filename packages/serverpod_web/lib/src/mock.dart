import 'dart:async';
import 'dart:js_interop';

abstract interface class DatabaseAccessor {}

extension type HttpRequest._(JSObject _) implements JSObject {
  external String get url;

  Uri get uri => Uri.parse(url);
  // external Headers get headers;
}

extension type HttpResponse._(JSObject _) implements JSObject {
  // external String get url;

  // Uri get uri => Uri.parse(url);
  // external Headers get headers;
}

class WebSocket
    implements
        Stream<dynamic /*String|List<int>*/ >,
        StreamSink<dynamic /*String|List<int>*/ > {
  // Implementing Stream methods
  @override
  StreamSubscription<dynamic> listen(void Function(dynamic event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> any(bool Function(dynamic element) test) {
    throw UnimplementedError();
  }

  @override
  Stream<T> asBroadcastStream(
      {void Function(StreamSubscription<dynamic> subscription)? onListen,
      void Function(StreamSubscription<dynamic> subscription)? onCancel}) {
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

  @override
  Stream<E> asyncExpand<E>(Stream<E>? Function(dynamic event) convert) {
    // TODO: implement asyncExpand
    throw UnimplementedError();
  }

  @override
  Stream<E> asyncMap<E>(FutureOr<E> Function(dynamic event) convert) {
    // TODO: implement asyncMap
    throw UnimplementedError();
  }

  @override
  Stream<R> cast<R>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  @override
  Future<bool> contains(Object? needle) {
    // TODO: implement contains
    throw UnimplementedError();
  }

  @override
  Stream distinct([bool Function(dynamic previous, dynamic next)? equals]) {
    // TODO: implement distinct
    throw UnimplementedError();
  }

  @override
  Future<E> drain<E>([E? futureValue]) {
    // TODO: implement drain
    throw UnimplementedError();
  }

  @override
  Future elementAt(int index) {
    // TODO: implement elementAt
    throw UnimplementedError();
  }

  @override
  Future<bool> every(bool Function(dynamic element) test) {
    // TODO: implement every
    throw UnimplementedError();
  }

  @override
  Stream<S> expand<S>(Iterable<S> Function(dynamic element) convert) {
    // TODO: implement expand
    throw UnimplementedError();
  }

  @override
  // TODO: implement first
  Future get first => throw UnimplementedError();

  @override
  Future firstWhere(bool Function(dynamic element) test, {Function()? orElse}) {
    // TODO: implement firstWhere
    throw UnimplementedError();
  }

  @override
  Future<S> fold<S>(
      S initialValue, S Function(S previous, dynamic element) combine) {
    // TODO: implement fold
    throw UnimplementedError();
  }

  @override
  Future<void> forEach(void Function(dynamic element) action) {
    // TODO: implement forEach
    throw UnimplementedError();
  }

  @override
  Stream handleError(Function onError, {bool Function(dynamic error)? test}) {
    // TODO: implement handleError
    throw UnimplementedError();
  }

  @override
  // TODO: implement isBroadcast
  bool get isBroadcast => throw UnimplementedError();

  @override
  // TODO: implement isEmpty
  Future<bool> get isEmpty => throw UnimplementedError();

  @override
  Future<String> join([String separator = ""]) {
    // TODO: implement join
    throw UnimplementedError();
  }

  @override
  // TODO: implement last
  Future get last => throw UnimplementedError();

  @override
  Future lastWhere(bool Function(dynamic element) test, {Function()? orElse}) {
    // TODO: implement lastWhere
    throw UnimplementedError();
  }

  @override
  // TODO: implement length
  Future<int> get length => throw UnimplementedError();

  @override
  Stream<S> map<S>(S Function(dynamic event) convert) {
    // TODO: implement map
    throw UnimplementedError();
  }

  @override
  Future pipe(StreamConsumer streamConsumer) {
    // TODO: implement pipe
    throw UnimplementedError();
  }

  @override
  Future reduce(Function(dynamic previous, dynamic element) combine) {
    // TODO: implement reduce
    throw UnimplementedError();
  }

  @override
  // TODO: implement single
  Future get single => throw UnimplementedError();

  @override
  Future singleWhere(bool Function(dynamic element) test,
      {Function()? orElse}) {
    // TODO: implement singleWhere
    throw UnimplementedError();
  }

  @override
  Stream skip(int count) {
    // TODO: implement skip
    throw UnimplementedError();
  }

  @override
  Stream skipWhile(bool Function(dynamic element) test) {
    // TODO: implement skipWhile
    throw UnimplementedError();
  }

  @override
  Stream take(int count) {
    // TODO: implement take
    throw UnimplementedError();
  }

  @override
  Stream takeWhile(bool Function(dynamic element) test) {
    // TODO: implement takeWhile
    throw UnimplementedError();
  }

  @override
  Stream timeout(Duration timeLimit,
      {void Function(EventSink sink)? onTimeout}) {
    // TODO: implement timeout
    throw UnimplementedError();
  }

  @override
  Future<List> toList() {
    // TODO: implement toList
    throw UnimplementedError();
  }

  @override
  Future<Set> toSet() {
    // TODO: implement toSet
    throw UnimplementedError();
  }

  @override
  Stream<S> transform<S>(StreamTransformer<dynamic, S> streamTransformer) {
    // TODO: implement transform
    throw UnimplementedError();
  }

  @override
  Stream where(bool Function(dynamic event) test) {
    // TODO: implement where
    throw UnimplementedError();
  }
}
