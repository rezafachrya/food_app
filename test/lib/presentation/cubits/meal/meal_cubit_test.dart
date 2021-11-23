import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food/domain/entities/entities.dart';
import 'package:food/domain/usecases/usecases.dart';
import 'package:food/presentation/cubits/meal/meal_cubit.dart';
import 'package:mockito/mockito.dart';

class GetMealsMock extends Mock implements GetMeals {}

main() {
  late GetMealsMock getMealsMock;

  late MealCubit mealCubit;

  setUp(() {
    getMealsMock = GetMealsMock();

    mealCubit = MealCubit(
      getMeals: getMealsMock,
    );
  });

  tearDown(() {
    mealCubit.close();
  });

  test('bloc should have initial state as [MealInitial()]', () {
    expect(mealCubit.state.runtimeType, MealInitial);
  });

  blocTest(
    'should emit [MealLoading, MealLoadedSuccess] state when load data success',
    build: () => mealCubit,
    act: (MealCubit cubit) {
      when(getMealsMock.call(NoParams()))
          .thenAnswer((_) async => const Right([]));

      cubit.loadMeals();
    },
    // expect: () => [
    //   isA<MealLoading>(),
    //   isA<MealLoadedSuccess>(),
    // ],
    // verify: (MealCubit cubit) {
    //   verify(getMealsMock.call(NoParams())).called(1);
    // }
  );

  blocTest(
    'should emit [MealLoading, MealLoadedError] state when load data fail',
    build: () => mealCubit,
    act: (MealCubit cubit) {
      when(getMealsMock.call(NoParams()))
          .thenAnswer((_) async => const Left(AppError(AppErrorType.api)));

      cubit.loadMeals();
    },
    // expect: () => [
    //   isA<MealLoading>(),
    //   isA<MealLoadedError>(),
    // ],
    // verify: (MealCubit cubit) {
    //   verify(getMealsMock.call(NoParams())).called(1);
    // },
  );
}
