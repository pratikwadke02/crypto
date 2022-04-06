import 'package:crypto/screen/crypto_detail.dart';
import 'package:crypto/screen/home.dart';
import 'package:crypto/screen/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/crypto_detail': (context) => CryptoDetail(),
      },
    ));
}