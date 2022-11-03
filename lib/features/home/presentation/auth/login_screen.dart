import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/core/utils/app_fonts.dart';
import 'package:promina/core/utils/app_spaces.dart';
import 'package:promina/core/utils/app_strings.dart';
import 'package:promina/core/utils/font_styles.dart';
import 'package:promina/core/utils/routes.dart';
import 'package:promina/features/home/presentation/auth/bloc/auth_cubit.dart';
import 'package:promina/features/home/presentation/auth/bloc/auth_state.dart';
import 'package:promina/features/home/presentation/auth/widgets/glass_box.dart';
import 'package:promina/features/home/presentation/auth/widgets/btn.dart';

import '../../../../core/utils/app_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var contWidth = MediaQuery.of(context).size.width * 0.90;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess && state.authModel != null) {
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/login_background.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black12.withAlpha(50),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    PositionedDirectional(
                      top: 0,
                      start: 0,
                      child: Image.asset(
                        'assets/images/path.png',
                        width: size.width * 0.7,
                        height: size.height * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    PositionedDirectional(
                      top: size.height * 0.22,
                      start: 0,
                      end: 0,
                      child: Text(
                        AppStrings.galleryApp,
                        textAlign: TextAlign.center,
                        style: getBoldStyle(
                          fontColor: Colors.black,
                          fontSize: FontSize.s34,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 0,
                      end: 0,
                      top: size.height * 0.3,
                      child: Padding(
                        padding:
                        EdgeInsets.all(MediaQuery.of(context).padding.top),
                        child: GlassBox(
                          width: contWidth * 0.90,
                          height: contWidth * 0.90,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    AppStrings.login,
                                    style: getBoldStyle(
                                        fontColor: Colors.black, fontSize: 30),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: size.width * 0.7,
                                    child: TextField(

                                      controller: AuthCubit.get(context)
                                          .emailController,
                                      decoration: const InputDecoration(
                                        hintText: AppStrings.userName,
                                        border: OutlineInputBorder(),

                                      ),
                                    ),
                                  ),
                                  AppSpaces.vSpace20,
                                  SizedBox(
                                    width: size.width * 0.7,
                                    child: TextField(
                                      controller: AuthCubit.get(context)
                                          .passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: AppStrings.password,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  AppSpaces.vSpace20,
                                  SizedBox(
                                    width: size.width * 0.7,
                                    height: 50,
                                    child: ConditionalBuilder(
                                      condition: state is! AuthLoading,
                                      builder: (BuildContext context) {
                                        return BtnClick(
                                          text: AppStrings.login,
                                          color: AppColors.btnColor,
                                          onPressedButton: () {
                                            AuthCubit.get(context).login(
                                              email: AuthCubit.get(context)
                                                  .emailController
                                                  .text
                                                  .trim(),
                                              password: AuthCubit.get(context)
                                                  .passwordController
                                                  .text
                                                  .trim(),
                                            );
                                            // Navigator.pushNamed(
                                            //     context, Routes.home);
                                          },
                                        );
                                      },
                                      fallback: (BuildContext context) =>
                                      const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
