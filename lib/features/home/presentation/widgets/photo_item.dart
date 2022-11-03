import 'dart:io';

import 'package:flutter/material.dart';


class PhotoItem extends StatelessWidget {
  final File photo;

  const PhotoItem({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Image.file(
      photo,
      fit: BoxFit.cover,

    ));
  }
}
