import 'package:flutter/material.dart';

class CustomHero extends StatelessWidget {
  const CustomHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/img/barca_elche.webp',
              ),
            ),
          ),
          height: 720.0,
        ),
        Container(
          height: 720.0,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  stops: const [
                    0.0,
                    1.0
                  ])),
        ),
        SizedBox(
            height: 720.0,
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Mes Que Un Club",
                    style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.w800,
                        color: Colors.yellow[800]),
                  )),
            ))
      ],
    );
  }
}
