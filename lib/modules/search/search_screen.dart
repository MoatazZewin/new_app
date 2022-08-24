import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/cubit/news_cubit.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/news_states.dart';

class SearchScreen extends StatelessWidget {
  // const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        var textContellor = TextEditingController();
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  // controller: textContellor ,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return "please enter charar";
                    }
                    return null;
                  },
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },

                ),
              ),
              Expanded(
                child: buildArticle(list,
                  context,
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}
