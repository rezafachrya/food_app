import 'package:dio/dio.dart';
import 'package:food/data/core/core.dart';
import 'package:food/data/data_sources/data_sources.dart';
import 'package:food/data/database/database.dart';
import 'package:food/data/repositories/repositories_impls.dart';
import 'package:food/domain/repositories/repositories.dart';
import 'package:food/domain/usecases/usecases.dart';
import 'package:food/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:food/presentation/cubits/meal/meal_cubit.dart';
import 'package:food/presentation/cubits/meal_detail/meal_detail_cubit.dart';
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
  locator.registerLazySingleton<MealLocalDataSource>(
      () => MealLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<MealRemoteDataSource>(
      () => MealRemoteDataSourceImpls(locator()));
  locator.registerLazySingleton<MealRepository>(
      () => MealRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<GetMeals>(() => GetMeals(locator()));
  locator.registerFactory(() => MealCubit(
        getMeals: locator(),
      ));

  //Meal Detail DI
  locator.registerLazySingleton<GetMealDetail>(() => GetMealDetail(locator()));
  locator.registerFactory(() => MealDetailCubit(
        getMealDetail: locator(),
        favoriteCubit: locator(),
      ));

  //Meal Favorite
  locator.registerLazySingleton<SaveFavoriteMeal>(
      () => SaveFavoriteMeal(locator()));
  locator.registerLazySingleton<GetFavoriteMeals>(
      () => GetFavoriteMeals(locator()));
  locator.registerLazySingleton<DeleteFavoriteMeal>(
      () => DeleteFavoriteMeal(locator()));
  locator.registerLazySingleton<CheckIfFavoriteMeal>(
      () => CheckIfFavoriteMeal(locator()));

  locator.registerFactory(() => FavoriteCubit(
      saveFavoriteMeal: locator(),
      getFavoriteMeals: locator(),
      deleteFavoriteMeal: locator(),
      checkIfFavoriteMeal: locator()));
}
