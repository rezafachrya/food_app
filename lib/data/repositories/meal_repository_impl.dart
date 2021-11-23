part of 'repositories_impls.dart';

class MealRepositoryImpl extends MealRepository {
  final MealRemoteDataSource mealRemoteDataSource;
  final MealLocalDataSource mealLocalDataSource;

  MealRepositoryImpl(this.mealRemoteDataSource, this.mealLocalDataSource);

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

  @override
  Future<Either<AppError, MealDetailEntity>> getMeal(String id) async {
    try {
      final values = await mealRemoteDataSource.getMeal(id);
      return Right(values);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfFavoriteMeal(String mealId) async {
    try {
      final response =
          await mealLocalDataSource.checkIfFavoriteMeal(idMeal: mealId);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteMeal(String idMeal) async {
    try {
      // final response = await mealLocalDataSource.deleteFavoriteMeal(
      //     meal: Meal.fromJson(mealDetailEntity.toJson()));
      final response =
          await mealLocalDataSource.deleteFavoriteMeal(idMeal: idMeal);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MealEntity>>> getFavoriteMeals() async {
    try {
      final response = await mealLocalDataSource.getFavoriteMeals();
      List<MealModel> values = [];
      for (var element in response) {
        values.add(MealModel.fromJson(element.toJson()));
      }
      return Right(values);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveFavoriteMeal(
      MealDetailEntity mealDetailEntity) async {
    try {
      final response = await mealLocalDataSource.createFavoriteMeal(
          meal: Meal.fromJson(mealDetailEntity.toJson()));
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }
}
