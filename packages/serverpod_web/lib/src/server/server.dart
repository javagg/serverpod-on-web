import 'package:serverpod_serialization/serverpod_serialization.dart';
import 'endpoint.dart';
import 'endpoint_dispatch.dart';

class Serverpod {
  void logVerbose(String s) {}
}

// class EndpointConnector {
//   /// Reference to the [Endpoint].
//   final Endpoint endpoint;

//   EndpointConnector({required this.endpoint});
// }

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
