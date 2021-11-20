import 'package:moor_flutter/moor_flutter.dart';

class Meals extends Table {
  // autoIncrement automatically sets this to be the primary key
  // IntColumn get id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  // TextColumn get name => text().withLength(min: 1, max: 50)();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  // DateTimeColumn get dueDate => dateTime().nullable()();
  // Booleans are not supported as well, Moor converts them to integers
  // Simple default values are specified as Constants
  // BoolColumn get completed => boolean().withDefault(Constant(false))();

  TextColumn get idMeal => text()();
  TextColumn get strMeal => text().nullable()();
  TextColumn get strDrinkAlternate => text().nullable()();
  TextColumn get strCategory => text().nullable()();
  TextColumn get strArea => text().nullable()();
  TextColumn get strInstructions => text().nullable()();
  TextColumn get strMealThumb => text().nullable()();
  TextColumn get strTags => text().nullable()();
  TextColumn get strYoutube => text().nullable()();
  TextColumn get strIngredient1 => text().nullable()();
  TextColumn get strIngredient2 => text().nullable()();
  TextColumn get strIngredient3 => text().nullable()();
  TextColumn get strIngredient4 => text().nullable()();
  TextColumn get strIngredient5 => text().nullable()();
  TextColumn get strIngredient6 => text().nullable()();
  TextColumn get strIngredient7 => text().nullable()();
  TextColumn get strIngredient8 => text().nullable()();
  TextColumn get strIngredient9 => text().nullable()();
  TextColumn get strIngredient10 => text().nullable()();
  TextColumn get strIngredient11 => text().nullable()();
  TextColumn get strIngredient12 => text().nullable()();
  TextColumn get strIngredient13 => text().nullable()();
  TextColumn get strIngredient14 => text().nullable()();
  TextColumn get strIngredient15 => text().nullable()();
  TextColumn get strIngredient16 => text().nullable()();
  TextColumn get strIngredient17 => text().nullable()();
  TextColumn get strIngredient18 => text().nullable()();
  TextColumn get strIngredient19 => text().nullable()();
  TextColumn get strIngredient20 => text().nullable()();
  TextColumn get strMeasure1 => text().nullable()();
  TextColumn get strMeasure2 => text().nullable()();
  TextColumn get strMeasure3 => text().nullable()();
  TextColumn get strMeasure4 => text().nullable()();
  TextColumn get strMeasure5 => text().nullable()();
  TextColumn get strMeasure6 => text().nullable()();
  TextColumn get strMeasure7 => text().nullable()();
  TextColumn get strMeasure8 => text().nullable()();
  TextColumn get strMeasure9 => text().nullable()();
  TextColumn get strMeasure10 => text().nullable()();
  TextColumn get strMeasure11 => text().nullable()();
  TextColumn get strMeasure12 => text().nullable()();
  TextColumn get strMeasure13 => text().nullable()();
  TextColumn get strMeasure14 => text().nullable()();
  TextColumn get strMeasure15 => text().nullable()();
  TextColumn get strMeasure16 => text().nullable()();
  TextColumn get strMeasure17 => text().nullable()();
  TextColumn get strMeasure18 => text().nullable()();
  TextColumn get strMeasure19 => text().nullable()();
  TextColumn get strMeasure20 => text().nullable()();
  TextColumn get strSource => text().nullable()();
  TextColumn get strImageSource => text().nullable()();
  TextColumn get strCreativeCommonsConfirmed => text().nullable()();
  DateTimeColumn get dateModified => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {idMeal};
}
