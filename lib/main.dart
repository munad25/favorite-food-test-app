import 'package:favorite_meal/config/router/app_module.dart';
import 'package:favorite_meal/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await initializeDependencies();
  runApp(
    ModularApp(
      module: AppModule(),
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
