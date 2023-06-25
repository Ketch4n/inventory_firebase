import 'package:flutter/material.dart';
import 'package:hybrid/include/navbar.dart';

class MobileDash extends StatefulWidget {
  const MobileDash({super.key});

  @override
  State<MobileDash> createState() => _MobileDashState();
}

class _MobileDashState extends State<MobileDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Mobile Dash"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                  color: Colors.white,
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
                                    color: Colors.white,
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.green,
            height: 120,
            width: double.maxFinite,
          ))
        ],
      ),
    );
  }
}
