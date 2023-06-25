import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/component/set_state.dart';

import 'package:hybrid/controller/Login.dart';
import 'package:hybrid/desktop/desktop_login.dart';
import 'package:hybrid/mobile/mobile_login.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    Future logout() async {
      final value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              "Confirm Log out ?",
              style: TextStyle(color: Colors.red, fontFamily: "NexaBold"),
            ),
            content: const Text(
              'You will be required to login again next time',
              style: TextStyle(color: Colors.black, fontFamily: "NexaRegular"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LOGIN(
                        desktopBody: const DesktopLogin(),
                        mobileBody: const MobileLogin(),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );

      return value == true;
    }

    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(),
              child: Image.asset(
                'assets/img/neon.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const ListTile(
              title: Text(
                "Inventory",
              ),
            ),
            ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: const Text('Items'),
              onTap: () {
                // Navigator.of(context).pop(false);

                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const Items(),
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.swap_vert),
              title: const Text('Stocks'),
              onTap: () {
                // Navigator.of(context).pop(false);
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const Stocks(),
                //   ),
                // );
                setState(() {
                  SetState.index == 1;
                });
              },
            ),
            const Divider(),
            const ListTile(
              title: Text("Account"),
            ),
            const ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
            ),
            const ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: const Text('Log-out'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pop(false);
                logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
