part of 'meal_page.dart';

class BigPoster extends StatelessWidget {
  final MealDetailEntity meal;

  const BigPoster({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.vulcan.withOpacity(0.1),
                    Colors.white.withOpacity(0.2),
                  ],
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: meal.strMealThumb ?? '',
                placeholder: (context, url) => const SpinKitFadingCircle(
                  size: 45,
                  color: AppColor.blueChill,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                height: size.height * 0.5,
                width: double.infinity,
              ),
            ),
          ],
        ),
        Positioned(
          left: Sizes.dimen_8,
          right: Sizes.dimen_8,
          bottom: Sizes.dimen_8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.strMeal ?? '',
                    style: Theme.of(context).textTheme.blackHeadline6,
                  ),
                  Text(meal.strArea ?? '',
                      style: Theme.of(context).textTheme.greySubtitle1),
                ],
              ),
              Text(
                meal.strCategory ?? '',
                style: Theme.of(context).textTheme.yellowHeadline6,
              ),
            ],
          ),
        ),
        Positioned(
          left: Sizes.dimen_16,
          right: Sizes.dimen_16,
          top: Sizes.dimen_32,
          child: MealDetailAppBar(meal: meal),
        ),
      ],
    );
  }
}
