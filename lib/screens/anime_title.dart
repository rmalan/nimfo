import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nimfo/models/anime.dart';

class AnimeTitle extends StatelessWidget {
  final Anime anime;

  const AnimeTitle({ Key? key, required this.anime }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  anime.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/icons/star_fill.svg',
                      height: 20,
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      '${anime.score}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      anime.aired,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
