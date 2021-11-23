part of 'widgets.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEnabled
              ? [Colors.green[300]!, Colors.yellow]
              : [Colors.grey, Colors.grey],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.dimen_20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
      margin: const EdgeInsets.symmetric(vertical: Sizes.dimen_10),
      height: Sizes.dimen_40,
      child: TextButton(
        key: const ValueKey('main_button'),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
