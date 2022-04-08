import 'package:crypto/services/DataModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CryptoDetail extends StatefulWidget {
  @override
  _CryptoDetailState createState() => _CryptoDetailState();
}

class _CryptoDetailState extends State<CryptoDetail> {

  List<DataModel> x = [];


  @override
  Widget build(BuildContext context) {
    x = ModalRoute.of(context)!.settings.arguments as List<DataModel>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${x[0].id}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${x[0].price}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}