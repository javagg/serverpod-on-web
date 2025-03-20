import 'package:serverpod_serialization/serverpod_serialization.dart';

// import '../authentication/scope.dart';
import 'server.dart';
// import 'serverpod.dart';
import 'session.dart';

/// The [Endpoint] is an entrypoint to the [Server]. To add a custom [Endpoint]
/// to a [Server], create a subclass and place it in the `endpoints` directory.
/// Code will generated that builds the corresponding client library. To add
/// methods that can be accessed from the client, make sure that the first
/// argument of the method is a [Session] parameter.
abstract class Endpoint {
  late String _name;

  /// The name of this [Endpoint]. It will be automatically generated from the
  /// name of the class (excluding any Endpoint suffix).
  String get name => _name;

  /// Invoked when a message is sent to this endpoint from the client.
  /// Override this method to create your own custom [StreamingEndpoint].
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableModel message) async {}

  /// Override this method to setup a new stream when a client connects to the
  /// server.
  Future<void> streamOpened(StreamingSession session) async {}

  /// Called when a stream was closed.
  Future<void> streamClosed(StreamingSession session) async {}
}