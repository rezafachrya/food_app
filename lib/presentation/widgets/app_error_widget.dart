part of 'widgets.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;

  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? 'Something Went Wrong'
                : 'Check Network',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.blackSubtitle1,
          ),
          Button(
            onPressed: onPressed,
            text: 'Retry',
          ),
          //5
          // Button(
          //   onPressed: () => Wiredash.of(context).show(),
          //   text: TranslationConstants.feedback,
          // ),
        ],
      ),
    );
  }
}
