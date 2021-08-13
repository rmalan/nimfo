import 'package:flutter/material.dart';

List<Anime> animes (BuildContext context) {
  return [
    Anime(
      title: 'Fullmetal Alchemist: Brotherhood',
      score: 9.16,
      poster: 'assets/posters/fullmetal.webp',
    ),
    Anime(
      title: 'Gintama: The Final',
      score: 9.10,
      poster: 'assets/posters/gintama.webp',
    ),
    Anime(
      title: 'Shingeki no Kyojin Season 3 Part 2',
      score: 9.10,
      poster: 'assets/posters/shingekinokyojin.webp',
    ),
    Anime(
      title: 'Steins;Gate',
      score: 9.10,
      poster: 'assets/posters/steinsgate.webp',
    ),
    Anime(
      title: 'Fruits Basket: The Final',
      score: 9.90,
      poster: 'assets/posters/fruitsbasket.webp',
    ),
  ];
}

class Anime {
  final String title, poster;
  final double score;

  Anime({
    required this.title,
    required this.score,
    required this.poster,
  });
}
