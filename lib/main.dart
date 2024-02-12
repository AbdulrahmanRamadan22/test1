import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/cache/cache_helper.dart';
import 'package:flutter_application_2/core/api/dio_consumer.dart';
import 'package:flutter_application_2/cubit/user_cubit.dart';
import 'package:flutter_application_2/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      );
}
