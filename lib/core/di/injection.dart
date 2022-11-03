import 'package:get_it/get_it.dart';
import 'package:promina/features/home/presentation/bloc/home_cubit.dart';

import '../../features/home/presentation/auth/bloc/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> diInit() async {
  sl.registerFactory(() => AuthCubit());
  sl.registerFactory(() => HomeCubit());
}
