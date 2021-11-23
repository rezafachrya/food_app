part of 'favorite_page.dart';

class FavoriteMealCardWidget extends StatelessWidget {
  final MealEntity meal;

  const FavoriteMealCardWidget({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Sizes.dimen_8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(spreadRadius: 3, blurRadius: 5, color: Colors.black12)
          ]),
      child: GestureDetector(
        onTap: () {
          Modular.to.navigate(RouteList.mealDetail, arguments: meal);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(Sizes.dimen_8),
                  topLeft: Radius.circular(Sizes.dimen_8)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: meal.strMealThumb ?? '',
                    placeholder: (context, url) => const SpinKitFadingCircle(
                      size: 45,
                      color: AppColor.blueChill,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: 140,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => context
                          .read<FavoriteCubit>()
                          .delFavoriteMeal(meal.idMeal),
                      child: Padding(
                        padding: const EdgeInsets.all(Sizes.dimen_12),
                        child: Icon(
                          Icons.delete,
                          size: Sizes.dimen_28,
                          color: Colors.red[400],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
              width: 200,
              child: Text(
                meal.strMeal ?? '',
                style: Theme.of(context).textTheme.blackSubtitle1,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: Sizes.dimen_8),
                child: Text(meal.strCategory ?? '',
                    style: Theme.of(context).textTheme.greyCaption))
          ],
        ),
      ),
    );
  }
}
