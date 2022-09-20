import 'package:barcelona/views/components/appbar.dart';
import 'package:barcelona/views/components/drawer.dart';
import 'package:barcelona/views/components/home/hero.dart';
import 'package:barcelona/views/components/home/news.dart';
import 'package:barcelona/views/components/home/trophies.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          username: username,
        ),
        body: ListView(
          children: const [
            CustomHero(),
            NewsComponent(),
            TrophiesComponent(),
          ],
        ),
        drawer: CustomDrawer(
          username: username,
        ));
  }
}
