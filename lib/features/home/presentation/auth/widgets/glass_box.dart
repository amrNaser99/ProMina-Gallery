import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_contstants.dart';


class GlassBox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const GlassBox({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppConst.borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7,),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: AppConst.borderRadius,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: AppConst.borderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}


