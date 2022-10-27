import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morning_exercises/screens/exeriseshub.dart';

class ExerisesScreen extends StatefulWidget {
  ExerisesScreen({super.key, required this.exercises, required this.secound});
  Exercises exercises;
  int secound;
  @override
  State<ExerisesScreen> createState() => _ExerisesScreenState();
}

class _ExerisesScreenState extends State<ExerisesScreen> {
  bool? isComplete = false;
  int elapsedSeconds = 0;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (t) {
      if (t.tick == widget.secound) {
        t.cancel();
        setState(() {
          isComplete = true;
        });
      }
      setState(() {
        elapsedSeconds = t.tick;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.exercises.gif!,
              placeholder: (context, url) => Image(
                image: const AssetImage("assets/imgs/placeholder-image.jpg"),
              ),
              errorWidget: ((context, url, error) => const Icon(Icons.error)),
            ),
          ),
          isComplete != true
              ? SafeArea(
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${elapsedSeconds}/${widget.secound} S",
                        style: const TextStyle(color: Colors.black),
                      )),
                )
              : Container(),
          SafeArea(
              child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
              const SizedBox(
                width: 10,
              ),
              Hero(
                  tag: widget.exercises.title!,
                  child: Text(
                    widget.exercises.title!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ))
        ],
      ),
    );
  }
}
