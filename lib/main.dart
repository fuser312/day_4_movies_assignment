import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(
      MaterialApp(
        home: Movies(),
  ),
  );
}
String listOfMovies = MoviesList.moviesJsonList;

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {


  List movies = jsonDecode(listOfMovies);
  String nextMovie = "https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture-Kotlin/posters/038001.jpg";
  int movieNumber = 0;

  void viewNextMovie(){
    setState(() {
      movieNumber = movieNumber + 1;
    });
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Movies Poster',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: Container(
          color: Colors.black87,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Image(
//                height: 300,
//                width: 300,
                      image: NetworkImage(movies[movieNumber]["poster"]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.yellow,
                      child: FlatButton(
                        child: Text('Next Movie'),
                        onPressed: viewNextMovie,
    ),
            ),
          ),
            ],
          ),
        ),
//        get you created here
      ),
        ),
        ),
    );
  }
}



// You are given json string of movies list (see file movies.dart)
String moviesList = MoviesList.moviesJsonList;

// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here

