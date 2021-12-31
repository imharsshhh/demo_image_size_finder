import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset('assets/splash.png');
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Dimensions Example"),
      ),
      body: ListView(
        children: [
          FutureBuilder<ui.Image>(
            future: completer.future,
            builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
              if (snapshot.hasData) {
                return Text(
                  '${snapshot.data!.width}x${snapshot.data!.height}',
                );
              } else {
                return const Text('Loading...');
              }
            },
          ),
          image,
        ],
      ),
    );
  }
}
