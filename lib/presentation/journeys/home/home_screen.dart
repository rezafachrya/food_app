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
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
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
            //// LIST OF FOOD (TABS)
            // Container(
            //   width: double.infinity,
            //   color: Colors.white,
            //   child: Column(
            //     children: [
            //       CustomTabBar(
            //         titles: ['New Taste', 'Popular', 'Recommended'],
            //         selectedIndex: selectedIndex,
            //         onTap: (index) {
            //           setState(() {
            //             selectedIndex = index;
            //           });
            //         },
            //       ),
            //       SizedBox(
            //         height: 16,
            //       ),
            //       BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
            //         if (state is FoodLoaded) {
            //           List<Food> foods = state.foods
            //               .where((element) =>
            //                   element.types.contains((selectedIndex == 0)
            //                       ? FoodType.new_food
            //                       : (selectedIndex == 1)
            //                           ? FoodType.popular
            //                           : FoodType.recommended))
            //               .toList();

            //           return Column(
            //             children: foods
            //                 .map((e) => Padding(
            //                       padding: EdgeInsets.fromLTRB(
            //                           defaultMargin, 0, defaultMargin, 16),
            //                       child: FoodListItem(
            //                           food: e, itemWidth: listItemWidth),
            //                     ))
            //                 .toList(),
            //           );
            //         } else {
            //           return Center(
            //             child: loadingIndicator,
            //           );
            //         }
            //       }),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
