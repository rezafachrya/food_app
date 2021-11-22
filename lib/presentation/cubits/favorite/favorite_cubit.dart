import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food/domain/entities/entities.dart';
import 'package:food/domain/usecases/usecases.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final SaveFavoriteMeal saveFavoriteMeal;
  final GetFavoriteMeals getFavoriteMeals;
  final DeleteFavoriteMeal deleteFavoriteMeal;
  final CheckIfFavoriteMeal checkIfFavoriteMeal;

  FavoriteCubit({
    required this.saveFavoriteMeal,
    required this.getFavoriteMeals,
    required this.deleteFavoriteMeal,
    required this.checkIfFavoriteMeal,
  }) : super(FavoriteInitial());

  void toggleFavoriteMeal(
      MealDetailEntity mealDetailEntity, bool isFavorite) async {
    if (isFavorite) {
      await deleteFavoriteMeal(mealDetailEntity);
    } else {
      await saveFavoriteMeal(mealDetailEntity);
    }
    final response =
        await checkIfFavoriteMeal(MealParams(idMeal: mealDetailEntity.idMeal));
    emit(response.fold(
      (l) => FavoriteMealsError(),
      (r) => IsFavoriteMeal(r),
    ));
  }

  void loadFavoriteMeal() async {
    final Either<AppError, List<MealEntity>> response =
        await getFavoriteMeals(NoParams());

    emit(response.fold(
      (l) => FavoriteMealsError(),
      (r) => FavoriteMealsLoaded(r),
    ));
  }

  void delFavoriteMeal(MealDetailEntity mealDetailEntity) async {
    await deleteFavoriteMeal(mealDetailEntity);
    loadFavoriteMeal();
  }

  void checkIfMealFavorite(String mealId) async {
    final response = await checkIfFavoriteMeal(MealParams(idMeal: mealId));
    emit(response.fold(
      (l) => FavoriteMealsError(),
      (r) => IsFavoriteMeal(r),
    ));
  }
}
