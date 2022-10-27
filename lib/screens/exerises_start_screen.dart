import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morning_exercises/screens/exerises_screen.dart';
import 'package:morning_exercises/screens/exeriseshub.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerisesStartScreen extends StatefulWidget {
  ExerisesStartScreen({super.key, required this.exercises});
  final Exercises exercises;
  @override
  State<ExerisesStartScreen> createState() => _ExerisesStartScreenState();
}

class _ExerisesStartScreenState extends State<ExerisesStartScreen> {
  int secound = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Exercise"),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
              tag: widget.exercises.thumbnail!,
              child:
                  //  Image(
                  //   image: NetworkImage(
                  //     widget.exercises.thumbnail!,
                  //   ),
                  //   fit: BoxFit.cover,
                  //   height: MediaQuery.of(context).size.height,
                  // )
                  Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.exercises.thumbnail!,
                    placeholder: (context, url) => Image(
                      image:
                          const AssetImage("assets/imgs/placeholder-image.jpg"),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    errorWidget: ((context, url, error) =>
                        const Icon(Icons.error)),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF000000), Color(0x00000000)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center)),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: SleekCircularSlider(
                        appearance: const CircularSliderAppearance(),
                        onChange: (double value) {
                          secound = value.toInt();
                        },
                        initialValue: 30,
                        min: 10,
                        max: 60,
                        innerWidget: (v) {
                          return Center(
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                "${v.toInt()} S",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFE83350)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerisesScreen(
                                      exercises: widget.exercises,
                                      secound: secound,
                                    )));
                      },
                      child: const Text(
                        "Start Exericse",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
