part of 'widgets.dart';

class LineWidget extends StatelessWidget {
  final double top;
  final double bottom;

  const LineWidget({
    Key? key,
    required this.top,
    required this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(4)),
      margin: EdgeInsets.only(top: top, bottom: bottom),
      height: 4,
      width: 32,
    );
  }
}
