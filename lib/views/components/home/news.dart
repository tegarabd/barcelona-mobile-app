import 'package:barcelona/models/news.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsComponent extends StatelessWidget {
  final List<News> newsList = const [
    News(
        image: "assets/img/best_league_start_in_5_years.webp",
        title: "Best League Starts in 5 Years"),
    News(
        image: "assets/img/gavi_renew_contract.webp",
        title: "Gavi Renew His Contract Until 2026"),
    News(
        image: "assets/img/golden_boy.webp",
        title: "FC Barcelona Leads in Golden Boy 2022 Candidates"),
    News(
        image: "assets/img/lewandowski_in_fine_form.webp",
        title: "Lewandowski in Fine Form"),
  ];
  const NewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            "News",
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[800]),
          ),
          const SizedBox(
            height: 30,
          ),
          CarouselSlider(
            items: newsList
                .map((news) => Column(
                      children: [
                        Image.asset(news.image),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            news.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1.0,
                height: 350,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3)),
          ),
        ],
      ),
    );
  }
}
