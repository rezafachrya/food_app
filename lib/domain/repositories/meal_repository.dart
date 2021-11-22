part of 'repositories.dart';

abstract class MealRepository {
  Future<Either<AppError, List<MealEntity>>> getMeals();
}
