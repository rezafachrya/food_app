part of 'usecases.dart';

class DeleteFavoriteMeal extends UseCase<void, MealDetailEntity> {
  final MealRepository mealRepository;

  DeleteFavoriteMeal(this.mealRepository);

  @override
  Future<Either<AppError, void>> call(MealDetailEntity params) async {
    return await mealRepository.deleteFavoriteMeal(params);
  }
}
