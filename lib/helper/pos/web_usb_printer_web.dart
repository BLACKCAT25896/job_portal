import 'dart:typed_data';
import 'dart:js_interop';
import 'web_usb_js.dart';

class WebUsbPrinter {
  static Future<bool> connect() async {
    try {
      final res = await connectPrinter().toDart;
      return res.toDart;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> printBytes(Uint8List bytes) async {
    try {
      final jsArray = bytes.map((e) => e.toJS).toList().toJS;
      final res = await printRaw(jsArray).toDart;
      return res.toDart;
    } catch (e) {
      return false;
    }
  }
}
