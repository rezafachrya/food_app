part of 'data_sources.dart';

// TODO: Coba nanti dibuat DI nya
void createMeal({String? Mealname, String? mail}) async {
  Meal meal = Meal(idMeal: '1');

  await getItInstance<AppDatabase>().insertMeal(meal);
}

Future<List<Meal>> fetchMeal() async {
  return await getItInstance<AppDatabase>().getAllMeals();
}

Stream<List<Meal>> watchMeals() {
  return getItInstance<AppDatabase>().watchAllMeals();
}

Future<int> deleteMeal(Meal meal) async {
  return await getItInstance<AppDatabase>().deleteMeal(meal);
}

Future<bool> updateMeal(Meal meal) async {
  return await getItInstance<AppDatabase>().updateMeal(meal);
}
