part of 'meal_page.dart';

class MealDetailAppBar extends StatelessWidget {
  final MealDetailEntity meal;

  const MealDetailAppBar({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Modular.to.navigate(RouteList.homeScreen);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_36,
          ),
        ),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            //tau state favorite movie dari movie detail bloc
            if (state is IsFavoriteMeal) {
              return GestureDetector(
                onTap: () =>
                    BlocProvider.of<FavoriteCubit>(context).toggleFavoriteMeal(
                  meal,
                  state.isMealFavorite,
                ),
                child: Icon(
                  state.isMealFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_36,
                ),
              );
            } else {
              return const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_36,
              );
            }
          },
        ),
      ],
    );
  }
}
