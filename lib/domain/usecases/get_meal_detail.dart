part of 'usecases.dart';

class GetMealDetail extends UseCase<MealDetailEntity, MealParams> {
  final MealRepository mealRepository;

  GetMealDetail(this.mealRepository);

  @override
  Future<Either<AppError, MealDetailEntity>> call(MealParams params) async {
    return await mealRepository.getMeal(params.idMeal);
  }
}
