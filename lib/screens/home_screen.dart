import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/style/theme.dart' as Style;
import 'package:movie_list/widgets/best_movies.dart';
import 'package:movie_list/widgets/genres.dart';
import 'package:movie_list/widgets/now_playing.dart';
import 'package:movie_list/widgets/persons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white,),
        title: Text("Discover"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(EvaIcons.searchOutline, color: Colors.white,)
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          BestMovies(),
        ],
      ),
    );
  }
}