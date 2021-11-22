part of 'meal_detail_cubit.dart';

abstract class MealDetailState extends Equatable {
  const MealDetailState();

  @override
  List<Object> get props => [];
}

class MealDetailInitial extends MealDetailState {}

class MealDetailLoading extends MealDetailState {}

class MealDetailError extends MealDetailState {}

class MealDetailLoaded extends MealDetailState {
  final MealDetailEntity mealDetailEntity;

  const MealDetailLoaded(this.mealDetailEntity);

  @override
  List<Object> get props => [mealDetailEntity];
}
