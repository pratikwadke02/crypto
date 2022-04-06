import 'package:flutter/material.dart';

class CryptoDetail extends StatefulWidget {
  @override
  _CryptoDetailState createState() => _CryptoDetailState();
}

class _CryptoDetailState extends State<CryptoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
      ),
      body: Center(
        child: Text('Crypto Detail'),
      ),
    );
  }
}