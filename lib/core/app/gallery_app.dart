import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/core/di/injection.dart';
import 'package:promina/core/utils/app_strings.dart';
import 'package:promina/core/utils/routes.dart';

import '../../features/home/presentation/auth/bloc/auth_cubit.dart';
import '../../features/home/presentation/bloc/home_cubit.dart';
import '../utils/app_themes.dart';

class ProMinaApp extends StatelessWidget {
  const ProMinaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => sl<HomeCubit>(),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => sl<AuthCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppThemes.lightTheme,
          routes: Routes.routes,
          initialRoute: Routes.login,
          // initialRoute: Routes.login,
        ),
      ),
    );
  }
}
