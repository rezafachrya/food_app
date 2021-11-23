part of 'favorite_page.dart';

class FavoriteMealGridView extends StatelessWidget {
  final List<MealEntity> meals;

  const FavoriteMealGridView({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Sizes.dimen_8,
              right: Sizes.dimen_8,
              top: Sizes.dimen_8,
              bottom: Sizes.dimen_52),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: meals.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: Sizes.dimen_16,
            ),
            itemBuilder: (context, index) {
              return FavoriteMealCardWidget(
                meal: meals[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
