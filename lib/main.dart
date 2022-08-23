import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_app/shared/bloc_observer.dart';
import 'package:new_app/shared/cubit/news_cubit.dart';
import 'package:new_app/shared/cubit/news_states.dart';
import 'package:new_app/shared/network/local/cash_helper.dart';
import 'package:new_app/shared/network/remote/dio/dio_helper.dart';



import 'home_layout/news_app_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  runApp( MyApp(CashHelper.getBool(key: "isDark")));
  BlocOverrides.runZoned(
        () {



    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
   bool? fromShared;
  MyApp(this.fromShared);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..changeMode(fromShared: fromShared),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state){},
        builder:(context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),

              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
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
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),

              ),
              scaffoldBackgroundColor:HexColor('333739'),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                color: HexColor('333739'),
              ),

            ),
            themeMode:NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: NewsApp(),
          );
        }
      )


    );
  }
}
