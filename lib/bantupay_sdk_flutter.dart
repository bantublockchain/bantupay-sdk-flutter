library bantupay_sdk_flutter;

import 'dart:convert';
import 'dart:typed_data';

import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';

class BantupaySDK {
  Account createAccount() {
// create a completely new and unique pair of keys.
    KeyPair keyPair = KeyPair.random();

    // print("${keyPair.accountId}");
// GCFXHS4GXL6BVUCXBWXGTITROWLVYXQKQLF4YH5O5JT3YZXCYPAFBJZB

//  print("${keyPair.secretSeed}");
// SAV76USXIJOBMEQXPANUOQM6F5LIOTLPDIDVRJBFFE2MDJXG24TAPUU7

    /// Returns the human readable account ID of this key pair.

    //return {"publicKey": keyPair.accountId, "secretKey": keyPair.secretSeed};
    Account account = Account(keyPair.accountId, keyPair.secretSeed);

    return account;
  }

  String signHTTP(uri, body, secretKey) {
//uri == "" || uri == null || body == "" || body == null ? return ""
// create keypair using secretkey.

    try {
      KeyPair keyPair = KeyPair.fromSecretSeed(secretKey);
      // print('KeyPair: $keyPair');

      //List<int> list = '$uri$body'.codeUnits;
      List<int> list = utf8.encode('$uri$body');
      Uint8List bytes = Uint8List.fromList(list);

// sign with the keypair
      var signedData = keyPair.sign(bytes);

      var signedBase64Str = base64.encode(signedData.toList());

      ///  print('signedBase64Str: $signedBase64Str');

      return signedBase64Str;
    } catch (e) {
      return '';
    }
  }

  importAccount(secretKey) {
    try {
      KeyPair keyPair = KeyPair.fromSecretSeed(secretKey);
      return keyPair.accountId;
    } catch (e) {
      print('The error message is $e');
      return '';
    }
  }

  signBase64Txn(
      String secretKey, String transcationXDR, String networkPassphrase) {
    try {
      KeyPair keyPair = KeyPair.fromSecretSeed(secretKey);

      var txn = AbstractTransaction.fromEnvelopeXdrString(transcationXDR);

      Network network = new Network(networkPassphrase);

      var bytes = txn.hash(network);

// sign with the keypair
      var signedData = keyPair.sign(bytes);

      var signedBase64Str = base64.encode(signedData.toList());

      ///  print('signedBase64Str: $signedBase64Str');

      return signedBase64Str;
    } catch (e) {
      return '';
    }
  }
}

class Account {
  String? publicKey;
  String? secretKey;

  Account(String p, String s) {
    this.publicKey = p;
    this.secretKey = s;
  }

  @override
  String toString() {
    return "Public-Key: " + this.publicKey! + "Secret-Key: " + this.secretKey!;
  }
}
