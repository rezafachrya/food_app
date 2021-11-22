part of 'meal_cubit.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealInitial extends MealState {}

class MealLoadedSuccess extends MealState {
  final List<MealEntity> entities;

  const MealLoadedSuccess({required this.entities});

  @override
  List<Object> get props => [entities];
}

class MealLoading extends MealState {}

class MealLoadedError extends MealState {
  final String message;

  const MealLoadedError({required this.message});

  @override
  List<Object> get props => [message];
}
