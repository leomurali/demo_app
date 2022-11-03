import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {
  final int? id;
  final String? name;
  final String? year;
  final String? director;
  final String? mainStar;
  final String? description;
  final int? favoritedByUsers;
  final String? thumbnail;
  final List<String>? genres;

  MovieDetails({
    required this.id,
    required this.name,
    required this.year,
    required this.director,
    required this.mainStar,
    required this.description,
    required this.favoritedByUsers,
    required this.thumbnail,
    required this.genres,
  });

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  int? id;
  String? name;
  String? year;
  String? director;
  String? mainStar;
  String? description;
  int? favoritedByUsers;
  String? thumbnail;
  List<String>? genres;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    name = widget.name;
    year = widget.year;
    director = widget.director;
    mainStar = widget.mainStar;
    description = widget.description;
    favoritedByUsers = widget.favoritedByUsers;
    thumbnail = widget.thumbnail;
    genres = widget.genres;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          toolbarHeight: 60,
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Color(0xFF6F828E),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          title: const Text("Movie Information",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6F828E))),
        ),
        body: Column(
          children: [
            Container(
              color: const Color(0xFFFFFFFF),
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Movie Detail of : $name",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2471A3 ))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipPath(
                        clipper: DolDurmaClipper(
                          right: 40,
                          holeRadius: 40,
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xFFF9E79F),
                          ),
                          width: 300,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 16, 0, 20),
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment.topCenter,
                                          height: 80,
                                          width: 80,
                                          child: Image.network(
                                            "$thumbnail",
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(left:10,top: 4),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "$name",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF000000)),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              '$year',
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0XFF273746)),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Director",
                                                  softWrap: true,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0XFF000000)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '$director',
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0XFF839192)),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Genres  ",
                                                  softWrap: true,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0XFF000000)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  genres![0],
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0XFF839192)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if(widget.description != "")
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0, 8, 10, 10),
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      const Text(
                                        "Description",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0XFF000000)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "$description",
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0XFF839192)),
                                      )
                                    ],
                                  ),
                                ) ,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
