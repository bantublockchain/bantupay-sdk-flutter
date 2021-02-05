import 'package:flutter_test/flutter_test.dart';

import 'package:bantupay_sdk_flutter/bantupay_sdk_flutter.dart';

void main() {
  test('adds one to input values', () {
    expect(1 + 1, 2);
  });

  test('Signbase64 Transcation', () {
    String transcationXDR =
        'AAAAAOKtdgWGQ02FzacmAD1WhAhI5Dp7kPRojOGjNQj3FBWvAAAAZAAcmBgAAAAEAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAANQmFudHUuTmV0d29yawAAAAAAAAAAAAAAAAAAAA==';
    String secretKey =
        'SDBG73M4LPCPCQ6NQ4CP4LCF7MOOQGUFJRRBD26P6QKIHW2ESP5R7DDN';
    String networkPassphrase = 'Bantu Testnet';
    String expectedSignature =
        'XESLipMZt+y+W3UwJmIEqV5hJJa2OCQcBozMO+goVUUp4JAoCJGOR4smWnX8qiCogpJby4O7e0Usu7W24lUOCg==';

    expect(
        BantupaySDK()
            .signBase64Txn(secretKey, transcationXDR, networkPassphrase),
        expectedSignature);
  });
}
