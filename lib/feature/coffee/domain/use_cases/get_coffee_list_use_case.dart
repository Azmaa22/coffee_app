import 'package:coffee_app/core/error/failure.dart';
import 'package:coffee_app/feature/coffee/domain/entities/coffee.dart';
import 'package:coffee_app/feature/coffee/domain/repository/base_coffee_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoffeeListUseCase {
  final BaseCoffeeRepository baseCoffeeRepository;
  GetCoffeeListUseCase({required this.baseCoffeeRepository});
  Either<Failure, List<Coffee>> execute() {
    return baseCoffeeRepository.getCoffeeList();
  }
}
