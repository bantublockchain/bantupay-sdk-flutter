import 'package:flutter/material.dart';
import 'package:bantupay_sdk_flutter/bantupay_sdk_flutter.dart';

void main() {
  runApp(BantuPayFlutterDemoApp());
}

class BantuPayFlutterDemoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BantuPay Flutter SDK Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BantuPay Flutter SDK Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "";
  // StellarSDK sdk = StellarSDK.TESTNET;
  void _btPress() {
    setState(() {
      // KeyPair kp = KeyPair.random();
      var account = BantupaySDK().createAccount();
      var signedHttp = BantupaySDK().signHTTP('/', '', account.secretKey);
      //_message = "ID:\n" + kp.accountId + "\n\nSEED:\n" + kp.secretSeed;
      _message = "publicKey:\n" +
          account.publicKey +
          "\n\nSEED:\n" +
          account.secretKey +
          "\n\nSigned HTTP:\n" +
          signedHttp;
    });
    print(_message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '\nGenerate new random keypar\n\n',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$_message',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _btPress,
        tooltip: 'Press',
        child: Icon(Icons.add_circle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
