import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nimfo/models/anime.dart';
import 'dart:math' as math;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Nimfo - Anime Info',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            icon: SvgPicture.asset('assets/icons/search.svg'),
            onPressed: () {}
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CategoryList(),
            AnimeCarousel(),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({ Key? key }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;
  List<String> categories = ['Top Anime'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w600,
                color: index == selectedCategory
                        ? Color(0xFF12153D)
                        : Colors.black.withOpacity(0.4),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                        ? Colors.cyan[600]
                        : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimeCarousel extends StatefulWidget {
  @override
  _AnimeCarouselState createState() => _AnimeCarouselState();
}

class _AnimeCarouselState extends State<AnimeCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: animes.length,
          itemBuilder: (context, index) => buildAnimeSlider(index),
        ),
      ),
    );
  }

  Widget buildAnimeSlider(int index) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 350),
      opacity: initialPage == index ? 1 : 0.4,
      child: AnimatedBuilder(
        animation: _pageController, 
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            // value = index - _pageController.page;
            value = (value * 0.038).clamp(-1, 1);
          }
          return Transform.rotate(
            angle: math.pi * value,
            child: AnimeCard(
              anime: animes[index]
            ),
          );
        },
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final Anime anime;

  const AnimeCard({ Key? key, required this.anime }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black26,
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(anime.poster),
                ),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              anime.title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/star_fill.svg',
                height: 20,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '${anime.score}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
