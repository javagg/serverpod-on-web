// import 'dart:io';

import 'dart:io';

import 'package:serverpod/database.dart';
import 'package:serverpod/protocol.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';
import 'package:serverpod_shared/serverpod_shared.dart';
import 'endpoint.dart';
import 'endpoint_dispatch.dart';
import 'session.dart';
import '../mock.dart';

/// The [SerializationManager] is responsible for creating objects from a
/// serialization, but also for serializing objects. This class is typically
/// overridden by generated code. [SerializationManagerServer] is an extension to
/// also handle [Table]s.
abstract class SerializationManagerServer extends SerializationManager {
  /// The name of the module that defines the serialization.
  String getModuleName();

  /// Maps [Type]s to subclasses of [Table].
  Table? getTableForType(Type t);

  /// The desired structure of the database.
  List<TableDefinition> getTargetTableDefinitions();
}

class Serverpod {
  static Serverpod? _instance;

  late Session _internalSession;

  /// The main server managed by this [Serverpod].
  late Server server;

  /// The last created [Serverpod]. In most cases the [Serverpod] is a singleton
  /// object, although it may be possible to run multiple instances in the same
  /// program it's not recommended.
  static Serverpod get instance {
    if (_instance == null) {
      throw Exception('Serverpod has not been initialized. You need to create '
          'the Serverpod object before calling this method.');
    }
    return _instance!;
  }

  /// [SerializationManager] used to serialize [SerializableModel], both
  /// when sending data to a method in an [Endpoint], but also for caching, and
  /// [FutureCall]s.
  final SerializationManagerServer serializationManager;
  late SerializationManagerServer _internalSerializationManager;

  /// The server configuration, as read from the config/ directory.
  late ServerpodConfig config;
  
  void logVerbose(String s) {}
    /// Starts the Serverpod and all [Server]s that it manages.
  ///
  /// If [runInGuardedZone] is set to true (the default),
  /// the start function will be executed inside `runZonedGuarded`.
  /// Any errors during the start up sequence will cause the process to exit.
  /// Any runtime errors will be in their own error zone and will not crash the server.
  ///
  /// If [runInGuardedZone] is set to false, the start function will be executed in the same error zone as the caller.
  /// An [ExitException] will be thrown if the start up sequence fails.
  Future<void> start({bool runInGuardedZone = true}) async {
          // Main API server.
      serversStarted &= await server.start();
  }
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

    /// Starts the server.
  /// Returns true if the server was started successfully.
  Future<bool> start() async {
    return true;
  }

  HttpResponse handle(HttpRequest request) {
    return new HttpResponse();
  }
}
