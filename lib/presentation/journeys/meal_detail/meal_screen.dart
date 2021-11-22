part of 'meal_page.dart';

class MealScreen extends StatefulWidget {
  final MealEntity meal;

  const MealScreen({Key? key, required this.meal}) : super(key: key);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late MealDetailCubit mealDetailCubit;
  late FavoriteCubit favoriteCubit;

  @override
  void initState() {
    super.initState();
    mealDetailCubit = locator<MealDetailCubit>();
    favoriteCubit = mealDetailCubit.favoriteCubit;
    mealDetailCubit.loadMealDetail(widget.meal.idMeal);
  }

  @override
  void dispose() {
    mealDetailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.navigate(RouteList.initial);
        return false;
      },
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: mealDetailCubit),
            BlocProvider.value(value: favoriteCubit),
          ],
          child: BlocBuilder<MealDetailCubit, MealDetailState>(
            builder: (context, state) {
              if (state is MealDetailLoading) {
                return const Center(
                    child: SpinKitFadingCircle(
                  size: 45,
                  color: AppColor.blueChill,
                ));
              } else if (state is MealDetailLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BigPoster(
                        meal: state.mealDetailEntity,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16,
                          vertical: Sizes.dimen_8,
                        ),
                        child: Text(
                          state.mealDetailEntity.strInstructions ??
                              'Instructions Not Found',
                          style: Theme.of(context).textTheme.blackBody2,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                      //   child: Text(
                      //     TranslationConstants.cast.t(context),
                      //     style: Theme.of(context).textTheme.headline6,
                      //   ),
                      // ),
                      // CastWidget(),
                      // VideosWidget(videosCubit: _videosCubit),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text('Gagal Meload Data',
                      style: Theme.of(context).textTheme.blackHeadline5),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
