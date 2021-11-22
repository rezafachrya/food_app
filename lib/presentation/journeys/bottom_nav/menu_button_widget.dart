part of 'bottom_nav_page.dart';

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({
    Key? key,
    required this.iconImage,
    required this.iconName,
    required this.func,
  }) : super(key: key);

  final String iconImage;
  final String iconName;
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: 105,
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                func();
              },
              child: Container(
                height: 51,
                width: 51,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.blueChill),
                child: Image.asset(
                  iconImage,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              iconName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
