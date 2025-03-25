import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

class Sql {}

class Pool {
  Future runTx(Future Function(dynamic ctx) param0,
      {required TransactionSettings settings}) {}
}

class PgException {
  final String message;
  final String? code;
  final String? detail;

  PgException(
      {required this.message, required this.code, required this.detail});
}

final class ResultSchema {}

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

class ServerException {}

abstract class Session {}

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
