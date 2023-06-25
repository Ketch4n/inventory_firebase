import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class STOCKS extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  STOCKS({required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 620) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
