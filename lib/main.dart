import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food/common/constants/constants.dart';
import 'package:food/presentation/food_app.dart';
import 'package:food/presentation/journeys/bottom_nav/bottom_nav_page.dart';
import 'package:food/presentation/journeys/home/home_page.dart';
import 'package:food/presentation/journeys/meal_detail/meal_page.dart';
import 'di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  await setupLocator();
  runApp(ModularApp(module: AppModule(), child: const FoodApp()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RouteList.initial,
          child: (context, args) => const BottomNavScreen(),
        ),
        ChildRoute(
          RouteList.mealDetail,
          child: (context, args) => MealScreen(
            meal: args.data,
          ),
        ),
      ];
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.cyan,
//       ),
//       home: Home(),
//     );
//   }
// }


