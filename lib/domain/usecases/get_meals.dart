part of 'usecases.dart';

class GetMeals extends UseCase<List<MealEntity>, NoParams> {
  final MealRepository mealRepository;

  GetMeals(this.mealRepository);

  @override
  Future<Either<AppError, List<MealEntity>>> call(NoParams params) async {
    return await mealRepository.getMeals();
  }
}
