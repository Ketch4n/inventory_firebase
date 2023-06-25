// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LOGIN extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  LOGIN({required this.mobileBody, required this.desktopBody});

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
