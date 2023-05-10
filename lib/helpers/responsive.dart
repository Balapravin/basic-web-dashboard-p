import 'package:flutter/cupertino.dart';

int smallScreenSizeWidth = 852;
int largeScreenSizeWidth = 1200;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen}): super(key:key);

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenSizeWidth;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenSizeWidth &&
      MediaQuery.of(context).size.width <= largeScreenSizeWidth;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > largeScreenSizeWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      double maxWidth = constrains.maxWidth;
      if (maxWidth > largeScreenSizeWidth) {
        return largeScreen;
      } else if (maxWidth >= smallScreenSizeWidth &&
          maxWidth <= largeScreenSizeWidth) {
        return mediumScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
