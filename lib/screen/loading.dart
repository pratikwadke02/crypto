import 'dart:convert';

import 'package:crypto/services/crypto_data.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

import '../services/DataModel.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 
  Future<void> getCurrency() async {
    var url = Uri.parse('https://api.nomics.com/v1/currencies/ticker?key=cd8af16d3cee486e0e1644466633be92eac4bedd&ids=DOGE,BTC,ETH,XRP&interval=1d,30d&convert=INR');
    final response = await get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      List<DataModel> cryptoList = [];
      for (var i in jsonResponse) {
        DataModel dataModel = DataModel.fromJSON(i);
        cryptoList.add(dataModel);
      }
      print(cryptoList);
      Navigator.pushReplacementNamed(context, '/home', arguments: cryptoList);
    } else {
      print('Failed to load data');
    }
  }



  void initState() {
    super.initState();
    getCurrency();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}