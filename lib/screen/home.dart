import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> cryptoList = [
    'BTC',
    'ETH',
    'LTC',
  ]; 

  @override
  Widget build(BuildContext context) {
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
                print(value);
              },
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
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
                          child: Text(cryptoList[index][0]),
                        ),
                        title: Text(
                          cryptoList[index],
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