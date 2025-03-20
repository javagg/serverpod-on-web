import 'package:serverpod_serialization/serverpod_serialization.dart';

class Serverpod {}

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

class EndpointConnector {
  /// Reference to the [Endpoint].
  final Endpoint endpoint;

  EndpointConnector({required this.endpoint});
}

abstract class EndpointDispatch {
  Map<String, EndpointConnector> connectors = {};

  /// References to modules.
  Map<String, EndpointDispatch> modules = {};

  /// Tries to get an [EndpointConnector] for a given endpoint and method name.
  /// If the endpoint is not found, an [EndpointNotFoundException] is thrown.
  /// If the user is not authorized to access the endpoint, a [NotAuthorizedException] is thrown.
  Future<EndpointConnector> getEndpointConnector({
    required Session session,
    required String endpointPath,
  }) async {
    return _getEndpointConnector(endpointPath, (_) => session);
  }
}

class Server {
  /// The [Serverpod] managing the server.
  final Serverpod serverpod;

  /// Responsible for dispatching calls to the correct [Endpoint] methods.
  final EndpointDispatch endpoints;

  /// The [SerializationManager] used by the server.
  final SerializationManager serializationManager;

  Server(
    this.serializationManager, {
    required this.serverpod,
    required this.endpoints,
  });
}
