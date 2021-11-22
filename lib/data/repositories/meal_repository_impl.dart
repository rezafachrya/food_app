part of 'repositories_impls.dart';

class MealRepositoryImpl extends MealRepository {
  final MealRemoteDataSource mealRemoteDataSource;

  MealRepositoryImpl(this.mealRemoteDataSource);

  @override
  Future<Either<AppError, List<MealEntity>>> getMeals() async {
    try {
      final values = await mealRemoteDataSource.getMeals();
      return Right(values);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
