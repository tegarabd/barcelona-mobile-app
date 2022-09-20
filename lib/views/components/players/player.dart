import 'package:barcelona/models/player.dart';
import 'package:barcelona/views/pages/detail.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends StatelessWidget {
  final String username;
  final Player player;
  const PlayerComponent({super.key, required this.player, required this.username});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailPage(username: username, playerId: player.id);
          },
        ));
      },
      child: Stack(
        children: [
          Image.network(player.image),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(255, 4, 20, 63),
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      player.id != 0 ? player.id.toString() : "",
                      style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellow[800]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      player.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[800]),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
