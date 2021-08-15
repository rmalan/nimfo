import 'package:flutter/material.dart';
import 'package:nimfo/models/anime.dart';
import 'package:nimfo/screens/poster_fav_button.dart';
import 'package:nimfo/screens/synopsis.dart';
import 'package:nimfo/screens/synopsis_title.dart';
import 'package:nimfo/screens/anime_title.dart';

class DetailScreen extends StatelessWidget {
  final Anime anime;

  const DetailScreen({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            PosterFavButton(size: size, anime: anime),
            SizedBox(height: 10.0),
            AnimeTitle(anime: anime),
            SynopsisTitle(),
            Synopsis(anime: anime),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
