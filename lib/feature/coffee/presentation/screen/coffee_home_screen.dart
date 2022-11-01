import 'package:coffee_app/feature/coffee/presentation/screen/coffee_menu_screen.dart';
import 'package:flutter/material.dart';

class CoffeeHomeScreen extends StatelessWidget {
  const CoffeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -20) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(
                  milliseconds: 650,
                ),
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: const CoffeeMenuScreen(),
                  );
                },
              ),
            );
          }
        },
        child: Stack(
          children: [
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(
                        0xffA89276,
                      ),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: size.height * 0.15,
                left: 0.0,
                right: 0.0,
                height: size.height * 0.4,
                child: Hero(
                  tag: '11',
                  child: Image.asset(
                    'assets/images/11.png',
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 0.0,
              right: 0.0,
              height: size.height * 0.75,
              child: Hero(
                tag: '8',
                child: Image.asset(
                  'assets/images/8.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * -0.7,
              left: 0.0,
              right: 0.0,
              height: size.height,
              child: Hero(
                tag: '1',
                child: Image.asset(
                  'assets/images/1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                height: size.height * 0.14,
                right: 0.0,
                left: 0.0,
                bottom: size.height * 0.3,
                child: const Center(
                  child: Text(
                    'Coffee',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
