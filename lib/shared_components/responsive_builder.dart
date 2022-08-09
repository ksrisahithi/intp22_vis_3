import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder(
      {Key? key,
      required this.mobilebuilder,
      required this.tabbuilder,
      required this.desktopbuilder})
      : super(key: key);

  final Widget Function(BuildContext context, BoxConstraints constraints)
      mobilebuilder;
  final Widget Function(BuildContext context, BoxConstraints constraints)
      tabbuilder;
  final Widget Function(BuildContext context, BoxConstraints constraints)
      desktopbuilder;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;
  static bool isTab(BuildContext context) =>
      MediaQuery.of(context).size.width < 1250 &&
      MediaQuery.of(context).size.width >= 650;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1250;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1250) {
          return desktopbuilder(context, constraints);
        } else if (constraints.maxWidth >= 650) {
          return tabbuilder(context, constraints);
        } else {
          return mobilebuilder(context, constraints);
        }
      },
    );
  }
}
