import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../component/indicator.dart';
import '../component/method.dart';

class DesktopDash extends StatefulWidget {
  const DesktopDash({super.key});

  @override
  State<DesktopDash> createState() => _DesktopDashState();
}

class _DesktopDashState extends State<DesktopDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desktop Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 200,
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "Today",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "NexaBold",
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "02-24-23",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "NexaBold",
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              "200",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              "All Items",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 60,
                                        child: VerticalDivider(
                                          color: Colors.black54,
                                          thickness: 2,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              "50",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              "Stock-In",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 60,
                                        child: VerticalDivider(
                                          color: Colors.black54,
                                          thickness: 2,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              "25",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              "Stock-Out",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 200,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      child: PieChart(
                                        PieChartData(
                                          sectionsSpace: 5,
                                          centerSpaceRadius: 30,
                                          sections: getSection(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: IndicatorsWidget(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 200,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      child: PieChart(
                                        PieChartData(
                                          sectionsSpace: 5,
                                          centerSpaceRadius: 30,
                                          sections: getSection(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: IndicatorsWidget(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(2, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 640,
                          child: const Expanded(
                            child: SizedBox(
                              height: 200,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: IndicatorsWidget(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
