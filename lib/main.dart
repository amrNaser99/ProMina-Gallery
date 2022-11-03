import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promina/core/app/gallery_app.dart';
import 'package:promina/core/di/injection.dart';
import 'package:promina/services/network/dio_helper.dart';

import 'core/app/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  diInit();
  DioHelper.init();


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = MyBlocObserver();
  runApp(const ProMinaApp());
}
