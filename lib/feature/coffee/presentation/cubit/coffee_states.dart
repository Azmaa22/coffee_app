import 'package:coffee_app/core/utils/shared/enum/request_state.dart';
import 'package:coffee_app/feature/coffee/domain/entities/coffee.dart';
import 'package:equatable/equatable.dart';

class CoffeeStates extends Equatable {
  final List<Coffee> coffeeMenu;
  final RequestState coffeeState;
  final String errorMsg;

  const CoffeeStates({
    this.coffeeMenu = const [],
    this.coffeeState = RequestState.isLoading,
    this.errorMsg = '',
  });

  @override
  List<Object?> get props => [
        coffeeMenu,
        coffeeState,
        errorMsg,
      ];

  CoffeeStates copyWith({
    List<Coffee>? coffeeMenu,
    RequestState? coffeeState,
    String? errorMsg,
  }) {
    return CoffeeStates(
      coffeeMenu: coffeeMenu ?? this.coffeeMenu,
      coffeeState: coffeeState ?? this.coffeeState,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
