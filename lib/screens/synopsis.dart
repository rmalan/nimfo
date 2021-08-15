import 'package:flutter/material.dart';
import 'package:nimfo/models/anime.dart';

class Synopsis extends StatelessWidget {
  final Anime anime;

  const Synopsis({ Key? key, required this.anime }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        anime.synopsis,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
