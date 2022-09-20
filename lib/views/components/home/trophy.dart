import 'package:barcelona/models/trophy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrophyComponent extends StatelessWidget {
  final Trophy trophy;
  const TrophyComponent({super.key, required this.trophy});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 300),
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Container(
          constraints: const BoxConstraints(minHeight: 50),
          child: Text(
            trophy.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SvgPicture.asset(
          trophy.image,
          color: Colors.yellow[800],
          width: 60,
          height: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          trophy.count.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.yellow[800],
          ),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
