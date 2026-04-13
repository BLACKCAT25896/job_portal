import 'dart:typed_data';

class EscPosBuilder {
  final List<int> _bytes = [];

  void init() => _bytes.addAll([0x1B, 0x40]);

  void text(String t) {
    _bytes.addAll(t.codeUnits);
    _bytes.add(0x0A);
  }

  void bold(bool on) => _bytes.addAll([0x1B, 0x45, on ? 1 : 0]);

  void alignCenter() => _bytes.addAll([0x1B, 0x61, 1]);
  void alignLeft() => _bytes.addAll([0x1B, 0x61, 0]);

  void cut() => _bytes.addAll([0x1D, 0x56, 0]);

  Uint8List build() => Uint8List.fromList(_bytes);
}
