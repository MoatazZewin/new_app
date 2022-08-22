import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/business_news/business_screen.dart';
import 'package:new_app/modules/science_news/science_screen.dart';
import 'package:new_app/modules/setting/setting_screen.dart';
import 'package:new_app/modules/sport_news/sport_screen.dart';
import 'package:new_app/shared/cubit/news_states.dart';
import 'package:new_app/shared/network/remote/dio/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitalState());
  int currentIndex = 0;
  List businessList = [];
  static NewsCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomNavigationItemsList = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: "Setting",
    ),
  ];

  List screens = [
    BusinessNews(),
    SportNews(),
    ScienceNews(),
    Setting(),
  ];

  void changeBottomNavBar(index)
  {
    currentIndex =index;
    if(index == 1)
      {
        getSports();
      }else if (index == 2)
        {
          getScience();
        }
    emit(NewsBottomNavigationChange());
  }

  void getBusiness()
  {
    emit(NewsGeTBusinessLoadingState());

     DioHelper.get("/v2/top-headlines",
        {
          'country':'eg',
          'category':'business',
          'apiKey':'5942752f848449d18161f5c842dcbcc8',

        }).then((value) {
          emit(NewsGeTBusinessSuccessState());
       businessList = value.data['articles'];
          print(businessList);
     }).catchError((onError){
       print(onError.toString());
       emit(NewsGetBusinessErorrState(onError.toString()));
     });

  }
  List sportsList = [];

  void getSports()
  {
    emit(NewsGeTSportsLoadingState());
    if(sportsList.length == 0)
      {
        DioHelper.get(
            '/v2/top-headlines',
            {
              'country':'eg',
              'category':'sports',
              'apiKey':'5942752f848449d18161f5c842dcbcc8'
            } ).then((value){
          sportsList = value.data['articles'];
          emit(NewsGeTSportsSuccessState());
        } ).catchError((onError){
          print(onError.toString());
          emit(NewsGetSportsErorrState(onError.toString()));
        });
      }else{
      emit(NewsGeTSportsSuccessState());
    }

  }

  List scienceList = [];

  void getScience()
  {
    emit(NewsGeTScienceLoadingState());
    if(scienceList.length == 0)
      {
        DioHelper.get('/v2/top-headlines',
          {
            'country':'eg',
            'category':'science',
            'apiKey':'5942752f848449d18161f5c842dcbcc8'
          },).then((value) {
          scienceList = value.data['articles'];
          emit(NewsGeTScienceSuccessState());
        }).catchError((onError){
          emit(NewsGetScienceErorrState(onError.toString()));
        });

      }else
        {
          emit(NewsGeTScienceSuccessState());
        }


  }
}
