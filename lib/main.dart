import 'package:awe_wallpaper/utils/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/get_it_manager.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark));
  GetItManager().register();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}