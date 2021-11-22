import 'package:dio/dio.dart';
import 'package:food/data/core/core.dart';
import 'package:food/data/data_sources/data_sources.dart';
import 'package:food/data/database/database.dart';
import 'package:food/data/repositories/repositories_impls.dart';
import 'package:food/domain/repositories/repositories.dart';
import 'package:food/domain/usecases/usecases.dart';
import 'package:food/presentation/cubits/meal/meal_cubit.dart';
// import 'package:food/data/database/database_manager.dart';
import 'package:get_it/get_it.dart';

// final getItInstance = GetIt.I;

GetIt locator = GetIt.instance;

Future setupLocator() async {
  //General DI
  locator.registerSingleton(openConnection());
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator()));

  //Meal DI
  locator.registerLazySingleton<MealRemoteDataSource>(
      () => MealRemoteDataSourceImpls(locator()));
  locator.registerLazySingleton<MealRepository>(
      () => MealRepositoryImpl(locator()));
  locator.registerLazySingleton<GetMeals>(() => GetMeals(locator()));
  locator.registerFactory(() => MealCubit(
        getMeals: locator(),
      ));
}
