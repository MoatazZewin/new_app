import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/cubit/news_states.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/news_cubit.dart';

class SportNews extends StatelessWidget {


  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context,state){
        var list = NewsCubit.get(context).sportsList;
        return buildArticle(list);
      },
    );
  }
}
