import 'package:flutter/material.dart';
import 'package:promina/core/utils/app_color.dart';
import 'package:promina/core/utils/app_spaces.dart';
import 'package:promina/core/utils/app_strings.dart';
import 'package:promina/core/utils/font_styles.dart';
import 'package:promina/features/home/presentation/auth/widgets/glass_box.dart';
import 'package:promina/features/home/presentation/bloc/home_cubit.dart';
import 'package:promina/features/home/presentation/widgets/home_btn.dart';

import '../../../../core/utils/app_contstants.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.mainPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        GlassBox(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.30,
          child: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width * 0.90,
            // height: MediaQuery.of(context).size.height * 0.30,
            margin: EdgeInsets.all(
              AppConst.mainPadding,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Choose Image From',
                    style:
                        getBoldStyle(fontColor: AppColors.black, fontSize: 18),
                  ),
                ),
                PositionedDirectional(
                  bottom: 30,
                  start: 10,
                  end: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: HomeBtn(
                            width: MediaQuery.of(context).size.width * 0.50,
                            icon: Icons.browse_gallery,
                            text: AppStrings.gallery,
                            onPressedBtn: () {
                              HomeCubit.get(context)
                                  .getImageFromGallery(context);
                            }),
                      ),
                      AppSpaces.vSpace20,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: HomeBtn(
                            width: MediaQuery.of(context).size.width * 0.50,
                            icon: Icons.camera,
                            text: AppStrings.camera,
                            onPressedBtn: () {
                              HomeCubit.get(context)
                                  .getImageFromCamera(context);
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
