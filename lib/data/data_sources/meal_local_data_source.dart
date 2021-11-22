part of 'data_sources.dart';

abstract class MealLocalDataSource {
  Future<void> createFavoriteMeal({required Meal meal});
  Future<bool> checkIfFavoriteMeal({required String idMeal});
  Future<void> deleteFavoriteMeal({required Meal meal});
  Future<List<Meal>> getFavoriteMeals();
}

class MealLocalDataSourceImpl extends MealLocalDataSource {
  final AppDatabase moorSql;

  MealLocalDataSourceImpl(this.moorSql);

  @override
  Future<bool> checkIfFavoriteMeal({required String idMeal}) async {
    var value = await moorSql.searchById(idMeal);
    if (value == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> createFavoriteMeal({required Meal meal}) async {
    return await moorSql.insertMeal(meal);
  }

  @override
  Future<void> deleteFavoriteMeal({required Meal meal}) async {
    await moorSql.deleteMeal(meal);
    return;
  }

  @override
  Future<List<Meal>> getFavoriteMeals() async {
    return await moorSql.getAllMeals();
  }
}

// TODO: Coba nanti dibuat DI nya
// void createMeal({String? Mealname, String? mail}) async {
//   Meal meal = Meal(idMeal: '1');

//   await getItInstance<AppDatabase>().insertMeal(meal);
// }

// Future<List<Meal>> fetchMeal() async {
//   return await getItInstance<AppDatabase>().getAllMeals();
// }

// Stream<List<Meal>> watchMeals() {
//   return getItInstance<AppDatabase>().watchAllMeals();
// }

// Future<int> deleteMeal(Meal meal) async {
//   return await getItInstance<AppDatabase>().deleteMeal(meal);
// }

// Future<bool> updateMeal(Meal meal) async {
//   return await getItInstance<AppDatabase>().updateMeal(meal);
// }
