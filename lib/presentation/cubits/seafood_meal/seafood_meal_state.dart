part of 'seafood_meal_cubit.dart';

abstract class SeafoodMealState extends Equatable {
  const SeafoodMealState();

  @override
  List<Object> get props => [];
}

class SeafoodMealInitial extends SeafoodMealState {}

class SeafoodMealLoadedSuccess extends SeafoodMealState {
  final List<MealEntity> entities;

  const SeafoodMealLoadedSuccess({required this.entities});

  @override
  List<Object> get props => [entities];
}

class SeafoodMealLoading extends SeafoodMealState {}

class SeafoodMealLoadedError extends SeafoodMealState {
  final AppErrorType errorType;
  // final String message;

  const SeafoodMealLoadedError({required this.errorType});

  @override
  List<Object> get props => [errorType];
}
