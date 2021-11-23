part of 'favorite_page.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteCubit favoriteCubit;

  @override
  void initState() {
    super.initState();
    favoriteCubit = locator<FavoriteCubit>();
    favoriteCubit.loadFavoriteMeal();
  }

  @override
  void dispose() {
    favoriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //// HEADER
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.dimen_24,
              ),
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
                        'Favorite Food',
                        style: Theme.of(context).textTheme.blackHeadline5,
                      ),
                      Text(
                        "Your favorite foods",
                        style: Theme.of(context).textTheme.greySubtitle1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ////List Favorite Meal
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: favoriteCubit),
              ],
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteMealsLoaded) {
                    if (state.meals.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'Favorite Food Not Found',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.blackSubtitle1,
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: FavoriteMealGridView(
                        meals: state.meals,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
