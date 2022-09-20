import 'dart:convert';

import 'package:barcelona/models/player.dart';
import 'package:barcelona/views/components/appbar.dart';
import 'package:barcelona/views/components/drawer.dart';
import 'package:barcelona/views/components/players/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayersPage extends StatefulWidget {
  final String username;
  const PlayersPage({super.key, required this.username});

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  late Future<List<Player>> playerList;

  Future<List<Player>> fetchPlayers() async {
    final String response =
        await rootBundle.loadString('assets/json/players.json');
    final data = await jsonDecode(response);
    List<Player> players = [];
    for (var playerJson in data) {
      players.add(Player.fromJson(playerJson));
    }
    return players;
  }

  @override
  void initState() {
    super.initState();
    playerList = fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          username: widget.username,
        ),
        body: FutureBuilder(
          future: playerList,
          builder: (context, snapshot) {
            var data = snapshot.data;
            return data != null
                ? GridView.count(
                    primary: false,
                    crossAxisCount: 2,
                    children: data
                        .map((player) => PlayerComponent(
                              player: player,
                              username: widget.username,
                            ))
                        .toList(),
                  )
                : Container();
          },
        ),
        drawer: CustomDrawer(
          username: widget.username,
        ));
  }
}
