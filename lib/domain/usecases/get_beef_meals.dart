part of 'usecases.dart';

class GetBeefMeals extends UseCase<List<MealEntity>, NoParams> {
  final MealRepository mealRepository;

  GetBeefMeals(this.mealRepository);

  @override
  Future<Either<AppError, List<MealEntity>>> call(NoParams params) async {
    return await mealRepository.getBeefMeals();
  }
}
