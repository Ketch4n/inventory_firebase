import 'package:flutter/material.dart';
import 'package:hybrid/component/dimension.dart';
import 'package:hybrid/controller/Dashboard.dart';
import 'package:hybrid/mobile/mobile_stocks.dart';

import '../component/set_state.dart';
import '../controller/Stocks.dart';
import '../desktop/dekstop_stocks.dart';
import '../desktop/desktop_dashboard.dart';
import '../include/desktop_navbar.dart';
import '../include/navbar.dart';
import '../mobile/mobile_dashboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _currentIndex = SetState.index;
  final List<Widget> _pages = <Widget>[];
  @override
  void initState() {
    _pages.add(DASHBOARD(
      desktopBody: const DesktopDash(),
      mobileBody: const MobileDash(),
    ));
    // _pages.add(const Items());
    _pages.add(STOCKS(
      desktopBody: DesktopStocks(),
      mobileBody: MobileStocks(),
    ));
    // getStocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > desktopWidth) {
      return Row(
        children: [
          // use SizedBox to constrain the AppMenu to a fixed width
          const SizedBox(
            width: 200,
            child: NavBar(),
          ),
          // vertical black line as separator
          Container(width: 0.5, color: Colors.black),
          // use Expanded to take up the remaining horizontal space
          const Expanded(
            child: DesktopDash(),
          ),
        ],
      );
    } else if (screenWidth <= 620) {
      return Scaffold(
        body: _pages[_currentIndex],
        // use SizedBox to contrain the AppMenu to a fixed width
        drawer: const SizedBox(
          width: 240,
          child: Drawer(
            child: NavBar(),
          ),
        ),
      );
    } else {
      return Row(
        children: [
          // use SizedBox to constrain the AppMenu to a fixed width
          const SizedBox(
            width: 60,
            child: DesktopNavBar(),
          ),
          // vertical black line as separator
          Container(width: 0.5, color: Colors.black),
          // use Expanded to take up the remaining horizontal space
          const Expanded(
            child: DesktopDash(),
          ),
        ],
      );
    }
  }
}
