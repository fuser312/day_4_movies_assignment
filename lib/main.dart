import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

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
  List newListOfMovies = [];

  void viewNextMovie(){
    setState(() {
      movieNumber = movieNumber + 1;
    });

  }
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < movies.length; i++){
      newListOfMovies.add(movies[i]["poster"]);
    }
    print(newListOfMovies);

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
        body: Center(
          child: Container(
            color: Colors.black87,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CarouselSlider(
                      height: 400.0,
                      autoPlay: true,
                      reverse: true,
                      items: newListOfMovies.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child:( Image(image: NetworkImage(i),
                                fit: BoxFit.cover,
                              )
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
              ],
            ),
          ),
//        get you created here
      ),
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

