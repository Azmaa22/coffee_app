import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Coffee extends Equatable {
  final String name, image;
  final double price;
  const Coffee({
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  List<Object?> get props => [
        name,
        image,
        price,
      ];
}
