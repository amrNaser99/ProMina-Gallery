import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/core/utils/app_contstants.dart';
import 'package:promina/core/utils/app_strings.dart';
import 'package:promina/core/utils/routes.dart';
import 'package:promina/features/home/models/auth_model.dart';
import 'package:promina/features/home/presentation/auth/bloc/auth_cubit.dart';
import 'package:promina/features/home/presentation/bloc/home_cubit.dart';
import 'package:promina/features/home/presentation/bloc/home_state.dart';
import 'package:promina/features/home/presentation/widgets/custom_dialog_box.dart';
import 'package:promina/features/home/presentation/widgets/home_btn.dart';
import 'package:promina/features/home/presentation/widgets/photo_item.dart';

import '../../../core/utils/font_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        AuthModel? model = AuthCubit.get(context).authModel;
        return SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.0),
                  ),
                  child: ConditionalBuilder(
                    condition: model != null,
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Welcome\n ${model?.user?.name}',
                                  style: getSemiBoldStyle(
                                    fontColor: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      Image.asset('assets/images/man.png')
                                          .image,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeBtn(
                                  image: 'assets/images/logout.png',
                                  text: AppStrings.logOut,
                                  onPressedBtn: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Routes.login,
                                    );
                                  }),
                              HomeBtn(
                                  image: 'assets/images/upload.png',
                                  text: AppStrings.upload,
                                  onPressedBtn: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const CustomDialogBox();
                                      },
                                    );

                                  }),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.58,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsetsDirectional.all(10),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  debugPrint('index $index');
                                },
                                child:
                                    PhotoItem(photo: cubit.photosList[index]),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              itemCount: cubit.photosList.length,
                              addAutomaticKeepAlives: true,
                              addRepaintBoundaries: true,
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
