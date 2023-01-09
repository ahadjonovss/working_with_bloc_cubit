// To parse this JSON data, do
//
//     final carFullInfo = carFullInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CarFullInfo? carFullInfoFromJson(String str) => CarFullInfo.fromJson(json.decode(str));

String carFullInfoToJson(CarFullInfo? data) => json.encode(data!.toJson());

class CarFullInfo {
  CarFullInfo({
    required this.id,
    required this.carModel,
    required this.logo,
    required this.establishedYear,
    required this.averagePrice,
    required this.description,
    required this.carPics,
  });

  int? id;
  String? carModel;
  String? logo;
  int? establishedYear;
  int? averagePrice;
  String? description;
  List<String?>? carPics;

  factory CarFullInfo.fromJson(Map<String, dynamic> json) => CarFullInfo(
    id: json["id"],
    carModel: json["car_model"],
    logo: json["logo"],
    establishedYear: json["established_year"],
    averagePrice: json["average_price"],
    description: json["description"],
    carPics: json["car_pics"] == null ? [] : List<String?>.from(json["car_pics"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "logo": logo,
    "established_year": establishedYear,
    "average_price": averagePrice,
    "description": description,
    "car_pics": carPics == null ? [] : List<dynamic>.from(carPics!.map((x) => x)),
  };
}
