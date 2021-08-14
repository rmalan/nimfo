import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nimfo/models/anime.dart';

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
            Title(anime: anime),
            SynopsisTitle(),
            Synopsis(anime: anime),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class PosterFavButton extends StatelessWidget {
  final Size size;
  final Anime anime;

  const PosterFavButton({ Key? key, required this.size, required this.anime }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(anime.poster)
              )
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.2,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5 ),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FavoriteButton(),
                ],
              ),
            )
          ),
          SafeArea(child: BackButton())
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final Anime anime;

  const Title({ Key? key, required this.anime }) : super(key: key);

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

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      iconSize: 36,
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class SynopsisTitle extends StatelessWidget {
  const SynopsisTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Text(
        'Synopsis',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

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
