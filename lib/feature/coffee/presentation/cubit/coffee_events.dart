import 'package:equatable/equatable.dart';

abstract class CoffeeEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCoffeeMenuEvent extends CoffeeEvents {}
