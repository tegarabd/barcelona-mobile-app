import 'package:barcelona/models/trophy.dart';
import 'package:barcelona/views/components/home/trophy.dart';
import 'package:flutter/material.dart';

class TrophiesComponent extends StatelessWidget {
  final List<Trophy> trophyList = const [
    Trophy(name: "La Liga", image: "assets/svg/laliga_trophy.svg", count: 26),
    Trophy(
        name: "UEFA Champions League",
        image: "assets/svg/ucl_trophy.svg",
        count: 5),
    Trophy(
        name: "FIFA Club World Cup",
        image: "assets/svg/club_wc_trophy.svg",
        count: 3),
    Trophy(name: "Copa Del Rey", image: "assets/svg/cdr_trophy.svg", count: 31)
  ];
  const TrophiesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      constraints: const BoxConstraints(minHeight: 40),
      child: Column(
        children: [
          Text(
            "Trophies",
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[800]),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 450,
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: trophyList
                    .map((trophy) => TrophyComponent(trophy: trophy))
                    .toList()),
          )
        ],
      ),
    );
  }
}
