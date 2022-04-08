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
        leading: Icon(
          Icons.attach_money,
          color: Colors.white,
        ),
        title: Text('Crypto App'),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Currency',
                
                // focusColor: Colors.white,
                hintText: 'Enter currency in INR',
                hintStyle: TextStyle(color: Color.fromARGB(146, 255, 255, 255)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.grey[800],
                filled: true,
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 208, 0),
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
                      color: Color.fromARGB(167, 44, 43, 43),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          child: Text(cryptoList[index].symbol[0]+cryptoList[index].symbol[1]+cryptoList[index].symbol[2]),
                        ),
                        title: Text(
                          '${input / double.parse(cryptoList[index].price)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 255, 255),
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