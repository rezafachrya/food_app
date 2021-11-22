part of 'entities.dart';

class MealEntity extends Equatable {
  final String idMeal;
  final String? strMeal;
  final String? strCategory;
  final String? strMealThumb;

  const MealEntity({
    required this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strMealThumb,
  });

  @override
  List<Object?> get props => [idMeal];
}
