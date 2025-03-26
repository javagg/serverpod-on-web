@JS("pg")
library;

import 'dart:js_interop';

extension type Sql._(JSObject _) implements JSObject {
  external JSPromise end();
}

@JS()
external Sql? postgres(String url, JSAny? b);

@JS()
external JSAny? sql(JSAny? handler);