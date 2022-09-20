import 'dart:convert';
import 'dart:math';

import 'package:barcelona/models/comment.dart';
import 'package:barcelona/models/player.dart';
import 'package:barcelona/views/components/appbar.dart';
import 'package:barcelona/views/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  final String username;
  final int playerId;
  const DetailPage({super.key, required this.username, required this.playerId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late Future<Player> player;
  late TabController tabController;
  late PreferredSizeWidget bottom;
  Random random = Random();
  TextEditingController ctrlComment = TextEditingController();
  int selectedIndex = 1;
  List<Comment> comments = [];
  List<Color> colors = [Colors.red, Colors.blue, Colors.yellow, Colors.green];

  Future<Player> fetchPlayer() async {
    final String response =
        await rootBundle.loadString('assets/json/players.json');
    final data = await jsonDecode(response);
    for (var playerJson in data) {
      Player player = Player.fromJson(playerJson);
      if (player.id == widget.playerId) {
        if (player.position == 'Goalkeeper') {
          return GoalKeeper.fromJson(playerJson);
        }
        return OutField.fromJson(playerJson);
      }
    }
    return Player.empty();
  }

  void onPressedComment(BuildContext context) {
    if (ctrlComment.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Comment must not be Empty')));
    } else {
      setState(() {
        comments = [
          ...comments,
          Comment(comment: ctrlComment.text, commenter: widget.username)
        ];
      });
      ctrlComment.text = "";
    }
  }

  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  void initState() {
    player = fetchPlayer();
    tabController = TabController(length: 2, vsync: this);
    bottom = TabBar(controller: tabController, tabs: const [
      Tab(
        icon: Icon(Icons.list_rounded),
        text: "Detail",
      ),
      Tab(
        icon: Icon(Icons.comment_rounded),
        text: "Comments",
      )
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        username: widget.username,
        bottom: bottom,
      ),
      drawer: CustomDrawer(username: widget.username),
      body: TabBarView(
        controller: tabController,
        children: [
          FutureBuilder(
            future: player,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Player player = snapshot.data!;

                List<Widget> children = [];

                if (player.position == "Goalkeeper") {
                  GoalKeeper goalKeeper = player as GoalKeeper;
                  children = [
                    Center(
                      child: Text(
                        "Stats",
                        style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[800]),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          goalKeeper.appearance.toString(),
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[800]),
                        ),
                        const Text("Appearance")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          goalKeeper.saves.toString(),
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[800]),
                        ),
                        const Text("Saves")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          goalKeeper.cleansheets.toString(),
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[800]),
                        ),
                        const Text("Cleansheets")
                      ],
                    ),
                  ];
                } else {
                  OutField outField = player as OutField;
                  children = [
                    Center(
                      child: Text(
                        "Stats",
                        style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[800]),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          outField.appearance.toString(),
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[800]),
                        ),
                        const Text("Appearance")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          outField.goals.toString(),
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[800]),
                        ),
                        const Text("Goals")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          outField.assists.toString(),
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[800]),
                        ),
                        const Text("Assists")
                      ],
                    ),
                  ];
                }

                return ListView(
                  children: [
                    Image.network(
                      player.image,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            player.id != 0 ? player.id.toString() : "",
                            style: TextStyle(
                                fontSize: 72,
                                fontWeight: FontWeight.w800,
                                color: Colors.yellow[800]),
                          ),
                          Expanded(
                              child: Text(
                            player.name,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[800]),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        player.description,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(player.bio,
                          style: const TextStyle(
                            fontSize: 18,
                          )),
                    ),
                    GridView.count(
                      physics:
                          const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true, //
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      children: children,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: TextField(
                        controller: ctrlComment,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Comment',
                          hintText: 'Comment',
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(50),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18)),
                          child: const Text('COMMENT'),
                          onPressed: () => onPressedComment(context),
                        )),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          ListView(
            children: comments.isNotEmpty
                ? comments
                    .map((comment) => ListTile(
                          leading: CircleAvatar(
                              backgroundColor: colors
                                  .elementAt(random.nextInt(colors.length))),
                          title: Text(comment.commenter),
                          subtitle: Text(comment.comment),
                        ))
                    .toList()
                : [
                    const Center(
                      heightFactor: 10,
                        child: Text("No comment yet"),
                      ),
                  ],
          )
        ],
      ),
    );
  }
}
