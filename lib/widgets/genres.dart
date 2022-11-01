import 'package:flutter/material.dart';
import 'package:movie_list/bloc/get_genres_bloc.dart';
import 'package:movie_list/model/genre.dart';
import 'package:movie_list/model/genre_response.dart';

import 'genres_list.dart';

class GenresScreen extends StatefulWidget {
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen>{
  

  @override
  void initState() {
    super.initState();
    genresBloc..getGenres();
    
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
        stream: genresBloc.subject.stream,
        builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
          if (!snapshot.hasData) {
            return _buildLoadingWidget();
          }

          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          }

          final list = snapshot.data!;
          if (list.error != null && list.error!.isNotEmpty) {
            return _buildErrorWidget(list.error.toString());
          }
          return _buildHomeWidget(list);
        },
      );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor:
                new AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(GenreResponse data) {
    List<Genre> genres = data.genres;
    print(genres);
    if (genres.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else 
      return GenresList(genres: genres,);
  }
}
