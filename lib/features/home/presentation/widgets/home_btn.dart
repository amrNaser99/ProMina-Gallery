import 'package:flutter/material.dart';

import '../../../../core/utils/font_styles.dart';

class HomeBtn extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final String text;
  final Function() onPressedBtn;
  final double? width;

  const HomeBtn({
    Key? key,
    this.image,
    this.icon,
    this.width,
    required this.text,
    required this.onPressedBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return InkWell(
        onTap: onPressedBtn,
        child: Container(
          width: width,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              if (image != null)
                Image.asset(
                  image!,
                ),
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.black,
                ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: getMediumStyle(
                  fontColor: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (width == null) {
      return InkWell(
        onTap: onPressedBtn,
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              if (image != null)
                Image.asset(
                  image!,
                ),
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.black,
                ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: getMediumStyle(
                  fontColor: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );
    } else
      return Container();
  }
}
