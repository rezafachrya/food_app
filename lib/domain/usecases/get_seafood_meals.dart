part of 'usecases.dart';

class GetSeafoodMeals extends UseCase<List<MealEntity>, NoParams> {
  final MealRepository mealRepository;

  GetSeafoodMeals(this.mealRepository);

  @override
  Future<Either<AppError, List<MealEntity>>> call(NoParams params) async {
    return await mealRepository.getSeafoodMeals();
  }
}
