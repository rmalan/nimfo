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
            BackdropAndRating(size: size, anime: anime),
            SizedBox(height: 10.0),
            TitleDurationAndFabBtn(anime: anime),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                "Plot Summary",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae nesciunt laudantium porro modi asperiores, ut unde nam, tempora explicabo hic optio dolore eum amet nostrum incidunt. Esse porro quam sint?',
                style: TextStyle(
                  color: Color(0xFF737599),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({ Key? key, required this.size, required this.anime }) : super(key: key);

  final Size size;
  final Anime anime;

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
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5 ),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/star_fill.svg'),
                      SizedBox(height: 5.0),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: '${anime.score}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              )
                            ),
                            TextSpan(text: '/10\n'),
                            TextSpan(
                              text: '150,210',
                              style: TextStyle(color: Color(0xFF9A9BB2))
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/star.svg'),
                      SizedBox(height: 5.0),
                      Text(
                        'Rate This',
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xFF51CF66),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          '7000.0',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Metascore',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '62 critic reviews',
                        style: TextStyle(color: Color(0xFF9A9BB2)),
                      )
                    ],
                  )
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

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({ Key? key, required this.anime }) : super(key: key);

  final Anime anime;

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
                SizedBox(height: 20.0 / 2),
                Row(
                  children: <Widget>[
                    Text(
                      '20xx',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'PG-13',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      '2h 32min',
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                  ],
                )
              ],
            )
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () {},
              color: Color(0xFFFE6D8E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
