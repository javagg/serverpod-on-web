import 'dart:js_interop';

extension type Sql._(JSObject _) implements JSObject {
  external factory Sql(JSAny? handler);
}

extension type Postgres._(JSObject _) implements JSObject {
  external factory Postgres(JSAny? a, JSAny? b);
  external Sql get sql;
  // external static int get staticMember;
}
