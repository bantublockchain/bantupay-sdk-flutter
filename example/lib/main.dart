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
  MyHomePage({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "";
  void _btPress() {
    setState(() {
      var bantuPaySDk = BantupaySDK();

      var account = bantuPaySDk.createAccount();
      var signedHttp = bantuPaySDk.signHTTP('/', '', account.secretKey);
      _message = "publicKey:\n" +
          account.publicKey! +
          "\n\nSEED:\n" +
          account.secretKey! +
          "\n\nSigned HTTP:\n" +
          signedHttp;
    });
    print(_message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '\nGenerate new random keypair\n\n',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '$_message',
              style: Theme.of(context).textTheme.bodyLarge,
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
