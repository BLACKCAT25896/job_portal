import 'dart:js_interop';

@JS('connectPrinter')
external JSPromise<JSBoolean> connectPrinter();

@JS('printRaw')
external JSPromise<JSBoolean> printRaw(JSArray<JSNumber> bytes);
