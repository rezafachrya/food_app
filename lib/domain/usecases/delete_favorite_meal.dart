part of 'usecases.dart';

class DeleteFavoriteMeal extends UseCase<void, MealParams> {
  final MealRepository mealRepository;

  DeleteFavoriteMeal(this.mealRepository);

  @override
  Future<Either<AppError, void>> call(MealParams params) async {
    return await mealRepository.deleteFavoriteMeal(params.idMeal);
  }
}
