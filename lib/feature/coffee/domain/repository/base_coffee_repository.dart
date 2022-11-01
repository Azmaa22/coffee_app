import 'package:coffee_app/core/error/failure.dart';
import 'package:coffee_app/feature/coffee/domain/entities/coffee.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCoffeeRepository {
  Either<Failure, List<Coffee>> getCoffeeList();
}
