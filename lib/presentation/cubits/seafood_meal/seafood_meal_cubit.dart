import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food/domain/entities/entities.dart';
import 'package:food/domain/usecases/usecases.dart';

part 'seafood_meal_state.dart';

class SeafoodMealCubit extends Cubit<SeafoodMealState> {
  final GetSeafoodMeals getSeafoodMeals;
  SeafoodMealCubit({required this.getSeafoodMeals})
      : super(SeafoodMealInitial());

  void loadSeafoodMeals() async {
    emit(SeafoodMealLoading());
    Either<AppError, List<MealEntity>> eitherResponse =
        await getSeafoodMeals(NoParams());

    emit(eitherResponse.fold(
      (l) => SeafoodMealLoadedError(errorType: l.appErrorType),
      (r) => SeafoodMealLoadedSuccess(entities: r),
    ));
  }
}
