import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food/domain/entities/entities.dart';
import 'package:food/domain/usecases/usecases.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final GetMeals getMeals;

  MealCubit({
    required this.getMeals,
  }) : super(MealInitial());

  void loadMeals() async {
    emit(MealLoading());
    Either<AppError, List<MealEntity>> eitherResponse =
        await getMeals(NoParams());

    emit(eitherResponse.fold(
      (l) => MealLoadedError(message: l.appErrorType.toString()),
      (r) => MealLoadedSuccess(entities: r),
    ));
  }
}
