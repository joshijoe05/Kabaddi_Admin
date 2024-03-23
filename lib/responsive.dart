import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const Responsive({super.key, required this.desktop, required this.mobile});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 860;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 860;

  w(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else {
      return mobile;
    }
  }
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(builder: ((context, constraints) {
  //     var maxWidth = MediaQuery.of(context).size.width;
  //     if (maxWidth > 860) {
  //       return desktop;
  //     } else {
  //       return mobile;
  //     }
  //   }));
  // }
}
