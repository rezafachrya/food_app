part of 'repositories.dart';

abstract class MealRepository {
  Future<Either<AppError, List<MealEntity>>> getMeals();
  Future<Either<AppError, MealDetailEntity>> getMeal(String id);
  Future<Either<AppError, void>> saveFavoriteMeal(
      MealDetailEntity mealDetailEntity);
  Future<Either<AppError, List<MealEntity>>> getFavoriteMeals();
  Future<Either<AppError, void>> deleteFavoriteMeal(String idMeal);
  Future<Either<AppError, bool>> checkIfFavoriteMeal(String mealId);
  Future<Either<AppError, List<MealEntity>>> getBeefMeals();
  Future<Either<AppError, List<MealEntity>>> getSeafoodMeals();
}
