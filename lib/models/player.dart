class Player {
  int id;
  String name;
  String position;
  String image;
  int appearance;
  String description;
  String bio;

  Player.empty()
      : id = 0,
        name = "",
        position = "",
        image = "",
        appearance = 0,
        description = "",
        bio = "";

  Player(
      {required this.id,
      required this.name,
      required this.position,
      required this.image,
      required this.appearance,
      required this.description,
      required this.bio});

  Player.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        position = json['position'],
        image = json['image'],
        appearance = json['detail']['appearance'],
        description = json['detail']['description'],
        bio = json['detail']['bio'];
}

class GoalKeeper extends Player {
  int cleansheets;
  int saves;

  GoalKeeper.fromJson(super.json)
      : cleansheets = json['detail']['cleansheets'],
        saves = json['detail']['saves'],
        super.fromJson();
}

class OutField extends Player {
  int goals;
  int assists;

  OutField.fromJson(super.json)
      : goals = json['detail']['goals'],
        assists = json['detail']['assists'],
        super.fromJson();
}
