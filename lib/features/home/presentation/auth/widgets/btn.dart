import 'package:flutter/material.dart';

import '../../../../../core/utils/font_styles.dart';

class BtnClick extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressedButton;

  const BtnClick({
    Key? key,
    required this.color,
    required this.onPressedButton,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedButton,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color,
        ),
      ),
      child: Text(
        text,
        style: getSemiBoldStyle(
          fontColor: Colors.white,
        ),
      ),
    );
  }
}
