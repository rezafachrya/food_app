import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food/domain/entities/entities.dart';
import 'package:food/domain/usecases/usecases.dart';
import 'package:food/presentation/cubits/favorite/favorite_cubit.dart';

part 'meal_detail_state.dart';

class MealDetailCubit extends Cubit<MealDetailState> {
  final GetMealDetail getMealDetail;
  final FavoriteCubit favoriteCubit;

  MealDetailCubit({
    required this.getMealDetail,
    required this.favoriteCubit,
  }) : super(MealDetailInitial());

  void loadMealDetail(String idMeal) async {
    emit(MealDetailLoading());
    final Either<AppError, MealDetailEntity> eitherResponse =
        await getMealDetail(
      MealParams(idMeal: idMeal),
    );

    emit(eitherResponse.fold(
      (l) => MealDetailError(errorType: l.appErrorType),
      (r) => MealDetailLoaded(r),
    ));

    favoriteCubit.checkIfMealFavorite(idMeal);
    // videosCubit.loadVideos(movieId);
  }
}
