library bantupay_sdk_flutter;

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
}

class Account {
  String publicKey;
  String secretKey;

  Account(String p, String s) {
    this.publicKey = p;
    this.secretKey = s;
  }

  @override
  String toString() {
    return "Public-Key: " + this.publicKey + "Secret-Key: " + this.secretKey;
  }
}
