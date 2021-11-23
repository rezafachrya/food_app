import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food/domain/entities/entities.dart';
import 'package:food/domain/usecases/usecases.dart';

part 'beef_meal_state.dart';

class BeefMealCubit extends Cubit<BeefMealState> {
  final GetBeefMeals getBeefMeals;
  BeefMealCubit({required this.getBeefMeals}) : super(BeefMealInitial());

  void loadBeefMeals() async {
    emit(BeefMealLoading());
    Either<AppError, List<MealEntity>> eitherResponse =
        await getBeefMeals(NoParams());

    emit(eitherResponse.fold(
      (l) => BeefMealLoadedError(errorType: l.appErrorType),
      (r) => BeefMealLoadedSuccess(entities: r),
    ));
  }
}
