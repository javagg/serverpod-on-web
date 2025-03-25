import 'dart:js_interop';
// import 'package:serverpod/server.dart';
import 'supabase.dart';
// import 'dart:convert';

// Response handleRequest(Request request) {
//   var uri = Uri.parse(request.url);
//   switch (uri.path) {
//     case "/":
//       return new Response(
//           template,
//           ResponseInit(
//               status: 200,
//               headers: Headers()..append("Content-Type", "text/html")));
//     case "/ws":
//       return handleWebSocket(request);
//     default:
//       return new Response("Not found", ResponseInit(status: 404));
//   }
// }

// void handleSession(WebSocket websocket) {
//   websocket.accept();
//   websocket.addEventListener(
//       "message",
//       ((MessageEvent event) {
//         if (event.data == "CLICK") {
//           // count += 1
//           websocket.sendString(jsonEncode({
//             "count": 1,
//             "tz": DateTime.now().toUtc().toIso8601String(),
//           }));
//         } else {
//           // An unknown message came into the server. Send back an error message
//           websocket.sendString(jsonEncode({
//             "error": "Unknown message received",
//           }));
//         }
//       }).toJS);

//   websocket.addEventListener(
//       "close",
//       ((CloseEvent event) {
//         // Handle when a client closes the WebSocket connection
//         print(event.reason);
//       }).toJS);
// }

// Response handleWebSocket(Request request) {
//   print(request.headers);
//   var upgradeHeader = request.headers.get("Upgrade");
//   print(upgradeHeader);
//   if (upgradeHeader != "websocket") {
//     return new Response("Expected websocket", ResponseInit(status: 400));
//   }

//   var ws = WebSocketPair();
//   var server = ws.server;
//   var client = ws.client;
//   handleSession(server);
//   return new Response(null, ResponseInit(status: 101, webSocket: client));
// }

class HttpRequest {}

Future<Response> handle(Request request) async {
  await Future.delayed(Duration(milliseconds: 100));
  return Response("hello dart!", ResponseInit());
}

@JS("Deno.serve")
external void serve(JSFunction callback);

@JS("Deno.upgradeWebSocket")
external void upgradeWebSocket(Request request);

Future<void> main() async {
  // serve(JSPromise(handle(request)).toJS);
  // var h = JSPromise(handle.toJS);
  serve((Request request) {
    var f = handle(request);
    return f.toJS;
  }.toJS);
}
