import 'package:coffee_app/core/constants/assets_manager.dart';
import 'package:coffee_app/feature/coffee/data/models/coffee_model.dart';

abstract class BaseCoffeeStaticData {
  List<CoffeeModel> getCoffeeList();
}

class CoffeeStaticData extends BaseCoffeeStaticData {
  @override
  List<CoffeeModel> getCoffeeList() {
    final List<CoffeeModel> coffees = List.generate(
      _coffeeNames.length,
      ((index) => CoffeeModel(
            name: _coffeeNames[index],
            image: '${AssetsManager.imagePath}${(index + 1)}.png',
            price: 1.5 * index + 1,
          )),
    );
    return coffees;
  }

  final List<String> _coffeeNames = [
    'Caramel Macchiato',
    'Caramel Cold Drink',
    'Iced Coffee Mocha',
    'Caramelized Pecan Latte',
    'Toffee Nut Latte',
    'Capuchino',
    'Toffee Nut Iced Latte',
    'Americano',
    'Vietnamese-Style Iced Coffee',
    ' Black Tea Latte',
    'Classic Irish Coffee',
    ' Toffee Nut Crunch Latte',
  ];
}
