import 'package:crypto/services/DataModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<String> cryptoList = [
  //   'BTC',
  //   'ETH',
  //   'LTC',
  // ]; 
  double input = 0.0;
  List<DataModel> cryptoList = [];


  

  @override
  Widget build(BuildContext context) {
    cryptoList = ModalRoute.of(context)!.settings.arguments as List<DataModel>;



    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Currency',
                hintText: 'Enter currency in INR',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                // fillColor: Color.fromARGB(178, 255, 255, 255),
                // filled: true,
                labelStyle: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                try {
                  setState(() {
                    input = double.parse(value);
                  });
                } catch (e) {
                  input = 0.0;
                }
              },
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      color: Colors.blue[900],
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(cryptoList[index].symbol[0]+cryptoList[index].symbol[1]+cryptoList[index].symbol[2]),
                        ),
                        title: Text(
                          '${input / double.parse(cryptoList[index].price)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/crypto_detail', arguments: cryptoList[index]);
                        },
                      ),
                    ),
                  );
                },
                itemCount: cryptoList.length,
              ),
            ),
          ],
          )
      )
      ),
    );
  }
}