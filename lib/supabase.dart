import 'dart:js_interop';

extension type Headers._(JSObject _) implements JSObject {
  external factory Headers();
  external void append(String name, String value);
  external String get(String name);
}

extension type ResponseInit._(JSObject _) implements JSObject {
  external factory ResponseInit({
    int? status,
    String? statusText,
    Headers? headers,
    // WebSocket? webSocket,
  });
}

extension type Request._(JSObject _) implements JSObject {
  external String get json;
  // external Headers get headers;
}

extension type Response._(JSObject _) implements JSObject {
  external factory Response(String? body, [ResponseInit? init]);
  // external factory Response.status(String url, int status);
}

extension type WebSocketUpgrade._(JSObject _) implements JSObject {
  external Response get response;
   external WebSocket get websocket;
}

extension type MessageEvent._(JSObject _) implements JSObject {
  external String get data;
}

extension type ErrorEvent._(JSObject _) implements JSObject {
  external String get message;
}

extension type OpenEvent._(JSObject _) implements JSObject {
}

extension type CloseEvent._(JSObject _) implements JSObject {
  // external int get code;
  // external String get reason;
}

extension type WebSocket._(JSObject _) implements JSObject {
  external void accept();
  // external void close({int code, String reason});
  @JS('send')
  external void sendString(String message);
  // @JS('send')
  // external void sendArrayBuffer(ArrayBuffer buffer);
  // @JS('send')
  // external void sendUint8List(Uint8List buffer);

 external set onerror(JSFunction callback);

 external set onclose(JSFunction callback);

  external void addEventListener(String message, JSFunction callback);
}