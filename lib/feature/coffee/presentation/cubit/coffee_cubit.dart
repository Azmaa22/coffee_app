import 'package:bloc/bloc.dart';
import 'package:coffee_app/core/utils/shared/enum/request_state.dart';
import 'package:coffee_app/feature/coffee/domain/use_cases/get_coffee_list_use_case.dart';
import 'package:coffee_app/feature/coffee/presentation/cubit/coffee_events.dart';
import 'package:coffee_app/feature/coffee/presentation/cubit/coffee_states.dart';

class CoffeeBloc extends Bloc<CoffeeEvents, CoffeeStates> {
  final GetCoffeeListUseCase getCoffeeListUseCase;
  CoffeeBloc({
    required this.getCoffeeListUseCase,
  }) : super(
          const CoffeeStates(),
        ) {
    on<GetCoffeeMenuEvent>((event, emit) async {
      var result = getCoffeeListUseCase.execute();

      result.fold((failure) {
        emit(
          state.copyWith(
            coffeeState: RequestState.isError,
            errorMsg: failure.message,
          ),
        );
      }, (data) {
        emit(
          state.copyWith(
            coffeeState: RequestState.isLoaded,
            coffeeMenu: data,
          ),
        );
      });
    });
  }
}
