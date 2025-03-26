import 'dart:async';
import 'dart:collection';
import 'dart:js_interop';
import 'src/js.dart';

// class Sql {
//   factory Sql.named(String sql, {String substitution}) {
//     throw UnimplementedError();
//   }
// }

class SessionSettings {}

class ConnectionSettings extends SessionSettings {}

class PoolSettings extends ConnectionSettings {}

abstract class SessionExecutor {
  /// Obtains a [Session] capable of running statements and calls [fn] with
  /// it.
  ///
  /// Returns the result (either the value or an error) of invoking [fn]. No
  /// updates will be reverted in the event of an error.
  Future<R> run<R>(
    Future<R> Function(Session session) fn, {
    SessionSettings? settings,
  });

  /// Obtains a [Session] running in a transaction and calls [fn] with it.
  ///
  /// Returns the result of invoking [fn] (either the value or an error). In
  /// case of [fn] throwing, the transaction will be reverted.
  ///
  /// Note that other invocations on a [Connection] are blocked while a
  /// transaction is active.
  Future<R> runTx<R>(
    Future<R> Function(TxSession session) fn, {
    TransactionSettings? settings,
  });

  /// Closes this session, cleaning up resources and forbiding further calls to
  /// [prepare] and [execute].
  ///
  /// If [force] is set to true, the session will be closed immediately, instead
  /// of waiting for any pending queries to finish.
  Future<void> close({bool force = false});
}

final class Endpoint {
  final String host;
  final int port;
  final String database;
  final String? username;
  final String? password;
  final bool isUnixSocket;

  Endpoint({
    required this.host,
    this.port = 5432,
    required this.database,
    this.username,
    this.password,
    this.isUnixSocket = false,
  });
}

class Connection implements Session, SessionExecutor {
  Sql conn;

  Connection(Sql this.conn);

  static Future<Connection> open(
    Endpoint endpoint, {
    ConnectionSettings? settings,
  }) async {
    var url = "postgres://${endpoint.username}:${endpoint.password}@${endpoint.host}:${endpoint.port}/${endpoint.database}";
    var conn = postgres(url, null);
    if (conn == null) {
      throw Exception("failed to connect to postgres");
    }
    return Connection(conn);
  }
  
  @override
  Future<void> close({bool force = false}) {
    return this.conn.end().toDart;
  }
  
  @override
  Future<Result> execute(Object query, {Object? parameters, bool ignoreRows = false, QueryMode? queryMode, Duration? timeout}) {
    // TODO: implement execute
    throw UnimplementedError();
  }
  
  @override
  Future<R> run<R>(Future<R> Function(Session session) fn, {SessionSettings? settings}) {
    // TODO: implement run
    throw UnimplementedError();
  }
  
  @override
  Future<R> runTx<R>(Future<R> Function(TxSession session) fn, {TransactionSettings? settings}) {
    // TODO: implement runTx
    throw UnimplementedError();
  }
  // Future<void> close() {}
  // Future<void> close() {}

  // Future<Result> execute(Sql sql, {List<Object?>? parameters}) {}
}

class Pool<L> implements Session, SessionExecutor {
  final _connections = <Connection>[];

  /// Creates a connection pool from a fixed list of endpoints.
  factory Pool.withEndpoints(
    List<Endpoint> endpoints, {
    PoolSettings? settings,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> close({bool force = false}) {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<Result> execute(Object query,
      {Object? parameters,
      bool ignoreRows = false,
      QueryMode? queryMode,
      Duration? timeout}) {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  Future<R> run<R>(Future<R> Function(Session session) fn,
      {SessionSettings? settings}) {
    // TODO: implement run
    throw UnimplementedError();
  }

  @override
  Future<R> runTx<R>(Future<R> Function(TxSession session) fn,
      {TransactionSettings? settings}) {
    // TODO: implement runTx
    throw UnimplementedError();
  }
}

class PgException {
  final String message;
  final String? code;
  final String? detail;

  PgException(
      {required this.message, required this.code, required this.detail});
}

final class ResultSchemaColumn {}

final class ResultSchema {
  final List<ResultSchemaColumn> columns;

  ResultSchema(this.columns);
}

class ResultRow extends UnmodifiableListView<Object?> {
  ResultRow(super.source);
}

class Result extends UnmodifiableListView<ResultRow> {
  final int affectedRows;
  final ResultSchema schema;

  Result({
    required List<ResultRow> rows,
    required this.affectedRows,
    required this.schema,
  }) : super(rows);
}

class ServerException extends PgException {
  /// The PostgreSQL error code.
  ///
  /// May be null if the exception was not generated by the database.
  final String? code;

  ServerException(this.code) : super(message: '', code: '', detail: '');
}

abstract class Session {
  /// Executes the [query] with the given [parameters].
  ///
  /// [query] must either be a [String] or a [Sql] object with types for
  /// parameters already set. If the types for parameters are already known from
  /// the query, a direct list of values can be passed for [parameters].
  /// Otherwise, the type of parameter types must be made explicit. This can be
  /// done by passing [TypedValue] objects in a list, or (if a string or
  /// [Sql.named] value is passed for [query]), via the names of declared
  /// statements.
  ///
  /// When [ignoreRows] is set to true, the implementation may internally
  /// optimize the execution to ignore rows returned by the query. Whether this
  /// optimization can be applied also depends on the parameters chosen, so
  /// there is no guarantee that the [Result] from a [ignoreRows] excution has
  /// no rows.
  ///
  /// [queryMode] is optional to override the default query execution mode that
  /// is defined in [SessionSettings]. Unless necessary, always prefer using
  /// [QueryMode.extended] which is the default value. For more information,
  /// see [SessionSettings.queryMode]
  Future<Result> execute(
    Object /* String | Sql */ query, {
    Object? /* List<Object?|TypedValue> | Map<String, Object?|TypedValue> */
        parameters,
    bool ignoreRows = false,
    QueryMode? queryMode,
    Duration? timeout,
  });
}

abstract class TxSession {
  Future<void> rollback();
}

class TransactionSettings {}

/// The isolation level of a transaction determines what data the transaction
/// can see when other transactions are running concurrently.
enum IsolationLevel {
  /// A statement can only see rows committed before it began.
  /// This is the default.
  readCommitted._('READ COMMITTED'),

  /// All statements of the current transaction can only see rows committed
  /// before the first query or data-modification statement was executed in
  /// this transaction.
  repeatableRead._('REPEATABLE READ'),

  /// All statements of the current transaction can only see rows committed
  /// before the first query or data-modification statement was executed in
  /// this transaction. If a pattern of reads and writes among concurrent
  /// serializable transactions would create a situation which could not have
  /// occurred for any serial (one-at-a-time) execution of those transactions,
  /// one of them will be rolled back with a serialization_failure error.
  serializable._('SERIALIZABLE'),

  /// One transaction may see uncommitted changes made by some other transaction.
  /// In PostgreSQL READ UNCOMMITTED is treated as READ COMMITTED.
  readUncommitted._('READ UNCOMMITTED'),
  ;

  /// The SQL identifier of the isolation level including "ISOLATION LEVEL" prefix
  /// and leading space.
  // @internal
  final String queryPart;

  const IsolationLevel._(String value) : queryPart = ' ISOLATION LEVEL $value';
}

/// Options for the Query Execution Mode
enum QueryMode {
  /// Extended Query Protocol
  extended,

  /// Simple Query Protocol
  simple,
}
