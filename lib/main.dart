import 'package:demo_app/view/MovieInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstIntroSlider(),
    );
  }
}

class FirstIntroSlider extends StatefulWidget {
  const FirstIntroSlider({super.key});

  @override
  _FirstIntroSliderState createState() => _FirstIntroSliderState();
}

class _FirstIntroSliderState extends State<FirstIntroSlider> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: const Color(0xFFFFFFFF),
        bottomNavigationBar:  Container(
          height: 40,
          margin: const EdgeInsets.only(top: 0, left: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 5, left: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          height: 8, width: 8,
                          decoration: BoxDecoration(color: const Color(0xFF3C78D9), shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF3C78D9), width: 1),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          height: 4, width: 4,
                          decoration: BoxDecoration(color: const Color(0xFFCDD3ED), shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFCDD3ED), width: 1),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          height: 4, width: 4,
                          decoration: BoxDecoration(color: const Color(0xFFCDD3ED), shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFCDD3ED), width: 1),
                          ),
                        ),
                      ],
                    )
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(MovieInfo());
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 0, right: 16,bottom: 24),
                  alignment: Alignment.centerLeft,
                  child: const Text("Next",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF9098B1))),
                ),
              ),
            ],
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Stack(
                        children: [
                          Expanded(
                            child: Container(
                              height: 480,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: 100,left: 10,right: 10),
                              child: Image.asset("images/ticket.png", fit: BoxFit.fill,),),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 40, right: 16),
                              alignment: Alignment.topRight,
                              child: const Text("Skip", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,  color: Color(0xFF9098B1))),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 44),
                        child: Center(
                          child: Column(
                            children: [
                               const Text("Booking Made Easy",
                                   textAlign: TextAlign.left,
                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF3B3B3B))),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: const Text("Quick & Simple to Book a Ticket ",
                                    style: TextStyle(fontSize: 16,  fontWeight: FontWeight.w400, color: Color(0xFF6F85A6))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 60,),
                    ],
                  ),
                ),
              ),

            ]),
      ),
    );
  }
}
