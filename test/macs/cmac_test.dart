// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastle.test.macs.cmac_test;

import "dart:typed_data";

import "package:pointycastle/pointycastle.dart";

import "../test/mac_tests.dart";

void main() {
  final mac = new Mac("AES/CMAC");

  // Test vectors from AES-CMAC RFC, section 4.
  // https://tools.ietf.org/html/rfc4493
  final key = new Uint8List.fromList([
    0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, //
    0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c, //
  ]);
  final keyParam = new KeyParameter(key);

  mac.init(keyParam);

  runMacTests(mac, [
    PlainTextDigestPair(
        Uint8List.fromList([]), "bb1d6929e95937287fa37d129b756746"),
    PlainTextDigestPair(
        Uint8List.fromList([
          0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, //
          0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a, //
        ]),
        "070a16b46b4d4144f79bdd9dd04a287c"),
    PlainTextDigestPair(
        Uint8List.fromList([
          0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, //
          0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a, //
          0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, //
          0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51, //
          0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11, //
        ]),
        "dfa66747de9ae63030ca32611497c827"),
    PlainTextDigestPair(
        Uint8List.fromList([
          0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, //
          0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a, //
          0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, //
          0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51, //
          0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11, //
          0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef, //
          0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17, //
          0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10, //
        ]),
        "51f0bebf7e3b9d92fc49741779363cfe"),
  ]);
}
