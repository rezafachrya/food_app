part of 'widgets.dart';

class ShimmerFoodCard extends StatelessWidget {
  const ShimmerFoodCard({Key? key}) : super(key: key);

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
              child: const ShimmerWidget.rectangular(
                height: Sizes.dimen_140,
                width: double.infinity,
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              width: 200,
              child: const ShimmerWidget.rectangular(height: Sizes.dimen_16)),
          const Padding(
              padding: EdgeInsets.only(left: 12),
              child: ShimmerWidget.rectangular(
                height: Sizes.dimen_12,
                width: Sizes.dimen_40,
              ))
        ],
      ),
    );
  }
}
