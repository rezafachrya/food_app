part of 'usecases.dart';

class SaveFavoriteMeal extends UseCase<void, MealDetailEntity> {
  final MealRepository mealRepository;

  SaveFavoriteMeal(this.mealRepository);

  @override
  Future<Either<AppError, void>> call(MealDetailEntity params) async {
    return await mealRepository.saveFavoriteMeal(params);
  }
}
