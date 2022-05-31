import 'package:flutter/material.dart';

Widget ImageBuilder(String urlImage, int index) => Container(
        child: Stack(children: [
      Image.network(
        urlImage,
        fit: BoxFit.cover,
        width: double.maxFinite,
      ),
    ]));
