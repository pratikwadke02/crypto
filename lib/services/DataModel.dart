import 'package:flutter/foundation.dart';

class DataModel{
  String? id;
  String price;
  String name;
  String rank;
  String symbol;
  String logo_url;

  DataModel({
    required this.name,
    required this.id,
    required this.price,
    required this.rank,
    required this.symbol,
    required this.logo_url,
  });

  factory DataModel.fromJSON(Map<String, dynamic> json){
    return DataModel(
      name: json['name'],
      id: json['id'],
      price: json['price'],
      rank: json['rank'],
      symbol: json['symbol'],
      logo_url: json['logo_url'],
    );
  }

}
