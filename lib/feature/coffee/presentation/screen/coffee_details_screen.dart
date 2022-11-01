import 'package:coffee_app/core/constants/assets_manager.dart';
import 'package:coffee_app/feature/coffee/domain/entities/coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  final Coffee coffee;
  const CoffeeDetailsScreen({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.25,
            ),
            child: Text(
              coffee.name,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: size.height * 0.5,
            child: Stack(children: [
              Positioned(
                left: 0.0,
                right: 0.0,
                child: Image.asset(
                  coffee.image,
                  height: size.height * 0.4,
                ),
              ),
              Positioned(
                bottom: 100,
                left: size.width * 0.08,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  tween: Tween(
                    begin: 1.0,
                    end: 0.0,
                  ),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(
                        -100 * value,
                        240 * value,
                      ),
                      child: child,
                    );
                  },
                  child: Text(
                    '${coffee.price.toString()} \$',
                    style: const TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10.0,
                            spreadRadius: 20.0,
                          )
                        ]),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: size.height * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TweenAnimationBuilder<double>(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  tween: Tween(
                    begin: 1.0,
                    end: 0.0,
                  ),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(
                        -100 * value,
                        240 * value,
                      ),
                      child: child,
                    );
                  },
                  child: Hero(
                    tag: 'small',
                    child: Column(
                      children: [
                        Image.asset(
                          AssetsManager.smallCupIcon,
                          width: 50.0,
                          height: 50.0,
                          color: Colors.grey,
                        ),
                        const Text(
                          'S',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TweenAnimationBuilder<double>(
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                  tween: Tween(
                    begin: 1.0,
                    end: 0.0,
                  ),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(
                        -100 * value,
                        240 * value,
                      ),
                      child: child,
                    );
                  },
                  child: Hero(
                    tag: 'medium',
                    child: Column(
                      children: [
                        Image.asset(
                          AssetsManager.mediumCupIcon,
                          width: 50.0,
                          height: 50.0,
                          color: Colors.grey,
                        ),
                        const Text(
                          'M',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TweenAnimationBuilder<double>(
                  duration: const Duration(
                    milliseconds: 1500,
                  ),
                  tween: Tween(
                    begin: 1.0,
                    end: 0.0,
                  ),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(
                        -100 * value,
                        240 * value,
                      ),
                      child: child,
                    );
                  },
                  child: Hero(
                    tag: 'large',
                    child: Column(
                      children: [
                        Image.asset(
                          AssetsManager.largeCupIcon,
                          width: 50.0,
                          height: 50.0,
                          color: Colors.grey,
                        ),
                        const Text(
                          'L',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: const Duration(
              milliseconds: 500,
            ),
            tween: Tween(
              begin: .5,
              end: 0.0,
            ),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(
                  -150 * value,
                  150 * value,
                ),
                child: child,
              );
            },
            child: SizedBox(
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Container(
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 2.5,
                              offset: const Offset(4, 10))
                        ]),
                    child: const Center(child: Text('Hot / Warm')),
                  )),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                      child: Container(
                    height: size.height * 0.08,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: const Center(child: Text('Cold / Ice')),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
