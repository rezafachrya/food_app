import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:food/di/get_it.dart';
import 'package:food/presentation/cubits/beef_meal/beef_meal_cubit.dart';
import 'package:food/presentation/cubits/meal/meal_cubit.dart';
import 'package:food/presentation/cubits/seafood_meal/seafood_meal_cubit.dart';
import 'package:food/presentation/themes/themes.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  late MealCubit mealCubit;
  late BeefMealCubit beefMealCubit;
  late SeafoodMealCubit seafoodMealCubit;

  @override
  void initState() {
    super.initState();
    mealCubit = locator<MealCubit>();
    beefMealCubit = locator<BeefMealCubit>();
    seafoodMealCubit = locator<SeafoodMealCubit>();
  }

  @override
  void dispose() {
    mealCubit.close();
    beefMealCubit.close();
    seafoodMealCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealCubit>.value(value: mealCubit),
        BlocProvider<BeefMealCubit>.value(value: beefMealCubit),
        BlocProvider<SeafoodMealCubit>.value(value: seafoodMealCubit),
      ],
      child: MaterialApp(
        title: 'Food App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
      ).modular(),
    );
  }
}
