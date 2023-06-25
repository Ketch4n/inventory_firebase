import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DesktopStocks extends StatefulWidget {
  const DesktopStocks({super.key});

  @override
  State<DesktopStocks> createState() => _DesktopStocksState();
}

class _DesktopStocksState extends State<DesktopStocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stocks")),
    );
  }
}
