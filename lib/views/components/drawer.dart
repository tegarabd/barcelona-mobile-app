import 'package:barcelona/views/pages/home.dart';
import 'package:barcelona/views/pages/login.dart';
import 'package:barcelona/views/pages/players.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String username;
  const CustomDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow[800],
              ),
              child: Text(
                username,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return HomePage(username: username);
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_alt_rounded),
              title: const Text('Players'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return PlayersPage(username: username);
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ));
              },
            ),
          ],
        ));
  }
}
