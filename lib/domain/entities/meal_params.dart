part of 'entities.dart';

class MealParams extends Equatable {
  final String idMeal;

  const MealParams({required this.idMeal});

  @override
  List<Object?> get props => [idMeal];
}
