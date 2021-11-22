part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final MealEntity meal;

  const FoodCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: CachedNetworkImage(
              imageUrl: meal.strMealThumb ?? '',
              placeholder: (context, url) => const SpinKitFadingCircle(
                size: 45,
                color: AppColor.blueChill,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              height: 140,
              width: double.infinity,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            width: 200,
            child: Text(
              meal.strMeal ?? '',
              style: Theme.of(context).textTheme.blackSubtitle1,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(meal.strCategory ?? '',
                  style: Theme.of(context).textTheme.greyCaption))
        ],
      ),
    );
  }
}
