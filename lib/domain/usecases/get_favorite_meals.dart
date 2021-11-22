part of 'usecases.dart';

class GetFavoriteMeals extends UseCase<List<MealEntity>, NoParams> {
  final MealRepository mealRepository;

  GetFavoriteMeals(this.mealRepository);

  @override
  Future<Either<AppError, List<MealEntity>>> call(NoParams params) async {
    return await mealRepository.getFavoriteMeals();
  }
}
