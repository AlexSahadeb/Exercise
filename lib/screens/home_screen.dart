import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morning_exercises/screens/exerises_start_screen.dart';
import 'package:morning_exercises/screens/exeriseshub.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExercisesHub? exercisesHub;

  final String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExercises();
  }

  void getExercises() async {
    var response = await http.get(Uri.parse(apiUrl));
    var body = response.body;
    var decodeJson = jsonDecode(body);
    exercisesHub = ExercisesHub.fromJson(decodeJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Morning Exercise"),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: Container(
          child: exercisesHub != null
              ? ListView(
                  children: exercisesHub!.exercises!.map((e) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExerisesStartScreen(exercises: e)));
                      },
                      child: Hero(
                        tag: e.id!,
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: Stack(
                              children: [
                                //   FadeInImage(
                                //     placeholder: const AssetImage(
                                //         "assets/imgs/placeholder-image.jpg"),
                                //     image: NetworkImage(e.thumbnail.toString()),
                                //     height: 250,
                                //     width: MediaQuery.of(context).size.width,
                                //     fit: BoxFit.cover,
                                //   ),
                                // ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: CachedNetworkImage(
                                    imageUrl: e.thumbnail!,
                                    placeholder: (context, url) => Image(
                                      image: const AssetImage(
                                        "assets/imgs/placeholder-image.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          Color(0xFF000000),
                                          Color(0x00000000)
                                        ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center)),
                                  ),
                                ),
                                Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 10),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    e.title.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                )
                              ],
                            )),
                      ),
                    );
                  }).toList(),
                )
              : LinearProgressIndicator(),
        ));
  }
}
