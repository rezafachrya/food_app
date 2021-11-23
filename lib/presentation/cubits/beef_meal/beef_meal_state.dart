part of 'beef_meal_cubit.dart';

abstract class BeefMealState extends Equatable {
  const BeefMealState();

  @override
  List<Object> get props => [];
}

class BeefMealInitial extends BeefMealState {}

class BeefMealLoadedSuccess extends BeefMealState {
  final List<MealEntity> entities;

  const BeefMealLoadedSuccess({required this.entities});

  @override
  List<Object> get props => [entities];
}

class BeefMealLoading extends BeefMealState {}

class BeefMealLoadedError extends BeefMealState {
  final AppErrorType errorType;
  // final String message;

  const BeefMealLoadedError({required this.errorType});

  @override
  List<Object> get props => [errorType];
}
