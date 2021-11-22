import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:food/di/get_it.dart';
import 'package:food/presentation/cubits/meal/meal_cubit.dart';
import 'package:food/presentation/themes/themes.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  late MealCubit mealCubit;

  @override
  void initState() {
    super.initState();
    mealCubit = locator<MealCubit>();
  }

  @override
  void dispose() {
    mealCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealCubit>.value(value: mealCubit),
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
