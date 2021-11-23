import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food/common/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  _startTime() async {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    //ini buat splash Screennya
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.navigate(RouteList.homeScreen);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(.7),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Text(
              'Food App',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            // child: Image.asset(SharedImage.logoImage),
          ),
        ),
      ),
    );
  }
}
