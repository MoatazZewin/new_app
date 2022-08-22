import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/cubit/news_cubit.dart';
import 'package:new_app/shared/cubit/news_states.dart';
import 'package:new_app/shared/network/remote/dio/dio_helper.dart';

class NewsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness() ,
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("NewsApp"),
              actions: [
                Icon(Icons.search),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavigationItemsList,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
            ),

          );
        }
            ,
      ),

    );
  }
}
