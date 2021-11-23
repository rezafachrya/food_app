part of 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MealCubit>(context).loadMeals();
    BlocProvider.of<BeefMealCubit>(context).loadBeefMeals();
    BlocProvider.of<SeafoodMealCubit>(context).loadSeafoodMeals();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //// HEADER
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Food App',
                        style: Theme.of(context).textTheme.blackHeadline5,
                      ),
                      Text(
                        "Let's get some foods",
                        style: Theme.of(context).textTheme.greySubtitle1,
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                            image: AssetImage(ImageConstants.userPic),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            //// LIST OF Meals
            SizedBox(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<MealCubit, MealState>(
                builder: (context, state) {
                  if (state is MealLoadedSuccess) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: state.entities
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == state.entities.first)
                                            ? Sizes.dimen_24
                                            : 0,
                                        right: Sizes.dimen_24),
                                    child: GestureDetector(
                                        onTap: () {
                                          Modular.to.navigate(
                                              RouteList.mealDetail,
                                              arguments: e);
                                        },
                                        child: FoodCard(
                                          meal: e,
                                        )),
                                  ))
                              .toList(),
                        )
                      ],
                    );
                  } else if (state is MealLoading) {
                    List<int> tempShimmerList = [1, 2, 3, 4, 5];
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: tempShimmerList
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == tempShimmerList.first)
                                            ? Sizes.dimen_24
                                            : 0,
                                        right: Sizes.dimen_24),
                                    child: GestureDetector(
                                      onTap: () {
                                        Modular.to.navigate(
                                            RouteList.mealDetail,
                                            arguments: e);
                                      },
                                      child: const ShimmerFoodCard(),
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    );
                  } else if (state is MealLoadedError) {
                    return Center(
                      child: AppErrorWidget(
                        errorType: state.errorType,
                        onPressed: () =>
                            BlocProvider.of<MealCubit>(context).loadMeals(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.dimen_24),
              child: Text(
                'Beef',
                style: Theme.of(context).textTheme.blackHeadline6,
              ),
            ),
            SizedBox(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<BeefMealCubit, BeefMealState>(
                builder: (context, state) {
                  if (state is BeefMealLoadedSuccess) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: state.entities
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == state.entities.first)
                                            ? Sizes.dimen_24
                                            : 0,
                                        right: Sizes.dimen_24),
                                    child: GestureDetector(
                                        onTap: () {
                                          Modular.to.navigate(
                                              RouteList.mealDetail,
                                              arguments: e);
                                        },
                                        child: FoodCard(
                                          meal: e,
                                        )),
                                  ))
                              .toList(),
                        )
                      ],
                    );
                  } else if (state is BeefMealLoading) {
                    List<int> tempShimmerList = [1, 2, 3, 4, 5];
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: tempShimmerList
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == tempShimmerList.first)
                                            ? Sizes.dimen_24
                                            : 0,
                                        right: Sizes.dimen_24),
                                    child: GestureDetector(
                                      onTap: () {
                                        Modular.to.navigate(
                                            RouteList.mealDetail,
                                            arguments: e);
                                      },
                                      child: const ShimmerFoodCard(),
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    );
                  } else if (state is BeefMealLoadedError) {
                    return Center(
                      child: AppErrorWidget(
                        errorType: state.errorType,
                        onPressed: () => BlocProvider.of<BeefMealCubit>(context)
                            .loadBeefMeals(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            //Seafood Meal
            Padding(
              padding: const EdgeInsets.only(left: Sizes.dimen_24),
              child: Text(
                'Seafood',
                style: Theme.of(context).textTheme.blackHeadline6,
              ),
            ),
            SizedBox(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<SeafoodMealCubit, SeafoodMealState>(
                builder: (context, state) {
                  if (state is SeafoodMealLoadedSuccess) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: state.entities
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == state.entities.first)
                                            ? Sizes.dimen_24
                                            : 0,
                                        right: Sizes.dimen_24),
                                    child: GestureDetector(
                                        onTap: () {
                                          Modular.to.navigate(
                                              RouteList.mealDetail,
                                              arguments: e);
                                        },
                                        child: FoodCard(
                                          meal: e,
                                        )),
                                  ))
                              .toList(),
                        )
                      ],
                    );
                  } else if (state is SeafoodMealLoading) {
                    List<int> tempShimmerList = [1, 2, 3, 4, 5];
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: tempShimmerList
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == tempShimmerList.first)
                                            ? Sizes.dimen_24
                                            : 0,
                                        right: Sizes.dimen_24),
                                    child: GestureDetector(
                                      onTap: () {
                                        Modular.to.navigate(
                                            RouteList.mealDetail,
                                            arguments: e);
                                      },
                                      child: const ShimmerFoodCard(),
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    );
                  } else if (state is SeafoodMealLoadedError) {
                    return Center(
                      child: AppErrorWidget(
                        errorType: state.errorType,
                        onPressed: () =>
                            BlocProvider.of<SeafoodMealCubit>(context)
                                .loadSeafoodMeals(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            const SizedBox(
              height: Sizes.dimen_64,
            )
          ],
        )
      ],
    );
  }
}
