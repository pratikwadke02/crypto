import 'package:flutter/foundation.dart';

class DataModel{
  String? id;
  String price;
  String name;
  String rank;
  String symbol;

  DataModel({
    required this.name,
    required this.id,
    required this.price,
    required this.rank,
    required this.symbol,
  });

  factory DataModel.fromJSON(Map<String, dynamic> json){
    return DataModel(
      name: json['name'],
      id: json['id'],
      price: json['price'],
      rank: json['rank'],
      symbol: json['symbol'],
    );
  }

}
