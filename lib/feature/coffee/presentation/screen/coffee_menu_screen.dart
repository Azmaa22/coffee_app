import 'package:coffee_app/feature/coffee/data/data_sources/static_data/coffee_static_data.dart';
import 'package:coffee_app/feature/coffee/data/repository/coffee_repository.dart';
import 'package:coffee_app/feature/coffee/domain/use_cases/get_coffee_list_use_case.dart';
import 'package:coffee_app/feature/coffee/presentation/cubit/coffee_cubit.dart';
import 'package:coffee_app/feature/coffee/presentation/cubit/coffee_events.dart';
import 'package:coffee_app/feature/coffee/presentation/cubit/coffee_states.dart';
import 'package:coffee_app/feature/coffee/presentation/screen/coffee_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _duration = Duration(
  milliseconds: 400,
);

class CoffeeMenuScreen extends StatefulWidget {
  const CoffeeMenuScreen({super.key});

  @override
  State<CoffeeMenuScreen> createState() => _CoffeeMenuScreenState();
}

class _CoffeeMenuScreenState extends State<CoffeeMenuScreen> {
  final _pageCoffeeController = PageController(
    viewportFraction: 0.36,
  );

  double _currentPage = 0.0;
  void _coffeeScrollListener() {
    setState(() {
      _currentPage = _pageCoffeeController.page!;
    });
  }

  @override
  void initState() {
    _pageCoffeeController.addListener(() {
      _coffeeScrollListener();
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageCoffeeController.removeListener(() {
      _coffeeScrollListener();
    });
    _pageCoffeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<CoffeeBloc>(
      create: (context) => CoffeeBloc(
        getCoffeeListUseCase: GetCoffeeListUseCase(
          baseCoffeeRepository: CoffeeRepository(
            baseCoffeeStaticData: CoffeeStaticData(),
          ),
        ),
      )..add(
          GetCoffeeMenuEvent(),
        ),
      child: BlocBuilder<CoffeeBloc, CoffeeStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: const BackButton(
                color: Colors.black,
              ),
            ),
            body: Stack(
              children: [
                Positioned(
                  left: 20.0,
                  right: 20.0,
                  height: size.height * 0.3,
                  bottom: -size.height * 0.22,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown,
                          blurRadius: 90.0,
                          offset: Offset.zero,
                          spreadRadius: 45.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 1.6,
                  alignment: Alignment.bottomCenter,
                  child: PageView.builder(
                    controller: _pageCoffeeController,
                    itemCount: state.coffeeMenu.length + 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const SizedBox.shrink();
                      }
                      final double result = _currentPage - index + 1;
                      final double value = -0.4 * result + 1;
                      final double opacity = value.clamp(0.0, 1.0);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(
                                milliseconds: 650,
                              ),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: index == 0
                                      ? CoffeeDetailsScreen(
                                          coffee: state.coffeeMenu[index],
                                        )
                                      : CoffeeDetailsScreen(
                                          coffee: state.coffeeMenu[index - 1],
                                        ),
                                );
                              },
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.05,
                          ),
                          child: Transform(
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()
                              ..setEntry(
                                3,
                                2,
                                0.001,
                              )
                              ..translate(
                                0.0,
                                size.height / 2.6 * (1 - value).abs(),
                              )
                              ..scale(
                                value,
                              ),
                            child: Opacity(
                              opacity: opacity,
                              child: Image.asset(
                                state.coffeeMenu[index - 1].image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    left: 0.0,
                    top: 0.0,
                    right: 0.0,
                    height: 100.0,
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          duration: _duration,
                          child: _currentPage.toInt() < 12 &&
                                  state.coffeeMenu.isNotEmpty
                              ? Text(
                                  state.coffeeMenu[_currentPage.toInt()].name,
                                  key: Key(
                                    state.coffeeMenu[_currentPage.toInt()].name,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        AnimatedSwitcher(
                          duration: _duration,
                          child: _currentPage.toInt() < 12 &&
                                  state.coffeeMenu.isNotEmpty
                              ? Text(
                                  '\$ ${state.coffeeMenu[_currentPage.toInt()].price}',
                                  key: Key(
                                    state.coffeeMenu[_currentPage.toInt()].name,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
