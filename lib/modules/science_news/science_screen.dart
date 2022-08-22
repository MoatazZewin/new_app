import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/news_cubit.dart';
import '../../shared/cubit/news_states.dart';

class ScienceNews extends StatelessWidget {


  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context,state){
        var list = NewsCubit.get(context).scienceList;
        return buildArticle(list);
      },
    );
  }
}
