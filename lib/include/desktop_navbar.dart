import 'package:flutter/material.dart';
import 'package:hybrid/component/dimension.dart';

class DesktopNavBar extends StatefulWidget {
  const DesktopNavBar({super.key});

  @override
  State<DesktopNavBar> createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
            screenWidth > desktopWidth
                ? const ListTile(
                    title: Text(
                      "Inventory",
                    ),
                  )
                : const SizedBox(),
            ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: screenWidth > desktopWidth
                  ? const Text('Items')
                  : const SizedBox(),
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
              title: screenWidth > desktopWidth
                  ? const Text('Stocks')
                  : const SizedBox(),
              onTap: () {
                // Navigator.of(context).pop(false);
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const Stocks(),
                //   ),
                // );
              },
            ),
            const Divider(),
            screenWidth > desktopWidth
                ? const ListTile(
                    title: Text("Account"),
                  )
                : const SizedBox(),
            ListTile(
              title: screenWidth > desktopWidth
                  ? const Text('Profile')
                  : const SizedBox(),
              leading: const Icon(Icons.person),
            ),
            ListTile(
              title: screenWidth > desktopWidth
                  ? const Text('Settings')
                  : const SizedBox(),
              leading: const Icon(Icons.settings),
            ),
            ListTile(
              title: screenWidth > desktopWidth
                  ? const Text('Log-out')
                  : const SizedBox(),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pop(false);
                // logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
