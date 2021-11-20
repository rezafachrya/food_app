import 'package:food/data/tables/meals.dart';
import 'package:moor/moor.dart';

part 'database_manager.g.dart';

@UseMoor(tables: [Meals])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        print('onCreate DB!!!');
        print('m.toString() : ${m.toString()}');
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {
        if (details.wasCreated) {
          print('DB was created!!!');
        }
      },
    );
  }

  // Get Meal
  Future<List<Meal>> getAllMeals() => select(meals).get();

  // Watch Meal
  Stream<List<Meal>> watchAllMeals() => select(meals).watch();

  // Add Meal
  Future insertMeal(Meal meal) => into(meals).insert(meal);

  // Update Meal
  Future updateMeal(Meal meal) => update(meals).replace(meal);

  // Delete Meal
  Future deleteMeal(Meal meal) => delete(meals).delete(meal);

  // Search Meal
  Future<List<Meal>> searchedMealList(String searchString) =>
      (select(meals)..where((tbl) => tbl.strMeal.contains(searchString))).get();
}
