import 'dart:async';
import 'dart:convert';
import 'package:demo_app/controller/Urls.dart';
import 'package:demo_app/models/MovieModel.dart';
import 'package:demo_app/view/MovieDetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MovieInfo());

class MovieInfo extends StatefulWidget {
  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  late Future<List<Movies>?> movieModel;

  @override
  void initState() {
    super.initState();
    movieModel = getHttpMovieInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Information',
      theme: ThemeData(
        primaryColor: Colors.black12,
      ),
      home: Scaffold(
          appBar: AppBar(
            titleSpacing: 10,
            toolbarHeight: 60,
            elevation: 1,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Color(0xFF6F828E),
                ),
                onPressed: () {},
              ),
            ),
            title: const Text("Dashboard",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6F828E))),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Top Movies",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2471A3 ))),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: FutureBuilder<List<Movies>?>(
                    future: movieModel,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              var id = snapshot.data![index].id;
                              var name = snapshot.data![index].name;
                              var year = snapshot.data![index].year;
                              var director = snapshot.data![index].director;
                              var mainStar = snapshot.data![index].mainStar;
                              var description =
                                  snapshot.data![index].description;
                              var favoritedByUsers =
                                  snapshot.data![index].favoritedByUsers;
                              var thumbnail = snapshot.data![index].thumbnail;
                              List<String>? genres =
                                  snapshot.data![index].genres;

                              Get.to(MovieDetails(
                                  id: id,
                                  name: name,
                                  year: year,
                                  director: director,
                                  mainStar: mainStar,
                                  description: description,
                                  favoritedByUsers: favoritedByUsers,
                                  thumbnail: thumbnail,
                                  genres: genres));
                              if (kDebugMode) {
                                print("id - $id");
                                print("name - $name");
                                print("year - $year");
                                print("director - $director");
                                print("mainStar - $mainStar");
                                print("description - $description");
                                print("favoriteByUsers - $favoritedByUsers");
                                print("thumbnail- $thumbnail");
                              }
                            },
                            child: Card(
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      "${snapshot.data![index].thumbnail}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                                        child: Text(
                                          "${snapshot.data![index].name}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF2471A3 )),
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.fromLTRB(6, 2, 0, 6),
                                          child: Text(
                                              snapshot.data![index].genres![0],
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF6F828E),
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<List<Movies>?> getHttpMovieInfo() async {
    String url = Urls.MOCKY_URL;
    if (kDebugMode) {
      print("url - $url");
    }
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Movies>? movieList =
          MovieModel.fromJson(jsonDecode(response.body)).data?.movies?.toList();
      return movieList;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
