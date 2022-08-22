import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/shared/bloc_observer.dart';



import 'home_layout/news_app_layout.dart';

void main() {

  BlocOverrides.runZoned(
        () {
      runApp( MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepOrange,
          type: BottomNavigationBarType.fixed,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          color: Colors.white,
        ),
      ),
      home: NewsApp(),
    );
  }
}
