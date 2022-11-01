import 'package:coffee_app/feature/coffee/domain/entities/coffee.dart';

class CoffeeModel extends Coffee {
  const CoffeeModel({
    required super.name,
    required super.image,
    required super.price,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) => CoffeeModel(
        name: json['name'],
        image: json['image'],
        price: json['price'],
      );
}
