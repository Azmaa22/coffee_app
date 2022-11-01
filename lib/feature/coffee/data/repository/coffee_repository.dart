import 'package:coffee_app/core/constants/strings_manager.dart';
import 'package:coffee_app/core/error/exceptions.dart';
import 'package:coffee_app/feature/coffee/data/data_sources/static_data/coffee_static_data.dart';
import 'package:coffee_app/feature/coffee/domain/entities/coffee.dart';
import 'package:coffee_app/core/error/failure.dart';
import 'package:coffee_app/feature/coffee/domain/repository/base_coffee_repository.dart';
import 'package:dartz/dartz.dart';

class CoffeeRepository extends BaseCoffeeRepository {
  final BaseCoffeeStaticData baseCoffeeStaticData;
  CoffeeRepository({required this.baseCoffeeStaticData});
  @override
  Either<Failure, List<Coffee>> getCoffeeList() {
    final result = baseCoffeeStaticData.getCoffeeList();
    try {
      return Right(result);
    } on StaticException catch (failure) {
      return const Left(
        StaticFailure(
          StringsManager.staticFailureMsg,
        ),
      );
    }
  }
}
