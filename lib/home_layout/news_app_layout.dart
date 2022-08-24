import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/search/search_screen.dart';
import 'package:new_app/shared/cubit/news_cubit.dart';
import 'package:new_app/shared/cubit/news_states.dart';
import 'package:new_app/shared/network/remote/dio/dio_helper.dart';

class NewsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("NewsApp"),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=> SearchScreen()));
              },
                  icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                cubit.changeMode();
              },
                  icon: Icon(Icons.brightness_4)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavigationItemsList,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
              print("the list of bussiness${cubit.businessList}");
            },
          ),

        );
      }
          ,
    );
  }
}
