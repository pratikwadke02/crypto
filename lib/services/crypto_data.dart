import 'dart:convert';
import 'package:http/http.dart';

class CryptoData{
  // String name;
  // number price;

  String key =  'cd8af16d3cee486e0e1644466633be92eac4bedd';

  Future<void> getCurrency() async {
    try{
      Response response = await get(Uri.parse('https://api.nomics.com/v1/currencies/ticker?key=$key&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1'));
      Map data = jsonDecode(response.body);
      print(data);
    }catch (e){
      print('Caught error: $e');
    }
  }
}