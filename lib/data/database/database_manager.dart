import 'package:food/data/tables/meals.dart';
import 'package:food/data/tables/users.dart';
import 'package:drift/drift.dart';

part 'database_manager.g.dart';

@DriftDatabase(tables: [Users, Meals])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {
        if (details.wasCreated) {}
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
  // Future deleteMeal(Meal meal) => delete(meals).delete(meal);
  Future deleteMeal(String idMeal) =>
      (delete(meals)..where((t) => t.idMeal.contains(idMeal))).go();

  // Search Meals
  Future<List<Meal>> searchedMealList(String searchString) =>
      (select(meals)..where((tbl) => tbl.strMeal.contains(searchString))).get();

  // Search Meal
  Future<Meal?> searchById(String id) {
    return (select(meals)..where((t) => t.idMeal.equals(id))).getSingleOrNull();
  }

  // Get user
  Future<List<User>> getAllUsers() => select(users).get();

  // Watch user
  Stream<List<User>> watchAllUsers() => select(users).watch();

  // Add user
  Future insertUser(User user) => into(users).insert(user);

  // Update user
  Future updateUser(User user) => update(users).replace(user);

  // Delete user
  Future deleteUser(User user) => delete(users).delete(user);

  // Search user
  Future<List<User>> searchedUserList(String searchString) =>
      (select(users)..where((tbl) => tbl.username.contains(searchString)))
          .get();
}
