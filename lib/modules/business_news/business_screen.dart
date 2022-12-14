import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/cubit/news_cubit.dart';
import 'package:new_app/shared/cubit/news_states.dart';

import '../../shared/components/components.dart';

class BusinessNews extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context,state){
        var list = NewsCubit.get(context).businessList;
        return list.length > 0 ? buildArticle(list, context): Center(child: CircularProgressIndicator()) ;
      },
    );
  }
}
