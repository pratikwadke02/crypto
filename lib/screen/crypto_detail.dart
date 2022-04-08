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

  


  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context)!.settings.arguments as Map;
    // print (data);
    DataModel x =ModalRoute.of(context)!.settings.arguments as DataModel;

    return Scaffold(
      appBar: AppBar(
         leading: Icon(
          Icons.attach_money,
          color: Colors.white,
        ),
        title: Text('Crypto App'),
        backgroundColor: Colors.grey[850],
      ),
      // backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            
            Card(
              color: Color.fromARGB(104, 255, 255, 255),
              child:ListTile(
                
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  child: Text(x.symbol[0] + x.symbol[1] + x.symbol[2]),
                  // style: TextStyle(color: Colors.white),
                ),
                title: Text(
                x.name,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              )
              
            ),
            Divider(
              height: 60.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0,),
            Card(
              color: Color.fromARGB(211, 44, 42, 42),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Price: ₹ ${x.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Rank: ${x.rank}',
                  style: TextStyle(
                     color: Colors.white,
                   fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
              ),
            )
              
              ]
            
        
        ),
        ),
      ),

    );
  }
}