part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteMealsLoaded extends FavoriteState {
  final List<MealEntity> meals;

  const FavoriteMealsLoaded(this.meals);

  @override
  List<Object> get props => [meals];
}

class FavoriteMealsError extends FavoriteState {}

class IsFavoriteMeal extends FavoriteState {
  final bool isMealFavorite;

  const IsFavoriteMeal(this.isMealFavorite);

  @override
  List<Object> get props => [isMealFavorite];
}
