part of 'usecases.dart';

class CheckIfFavoriteMeal extends UseCase<bool, MealParams> {
  final MealRepository mealRepository;

  CheckIfFavoriteMeal(this.mealRepository);

  @override
  Future<Either<AppError, bool>> call(MealParams params) async {
    return await mealRepository.checkIfFavoriteMeal(params.idMeal);
  }
}
