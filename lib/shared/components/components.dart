

import 'package:flutter/material.dart';

Widget buildArticleItem(Map artical) =>Padding(
  padding: EdgeInsets.all(20.0),
  child: Row(
    mainAxisSize: MainAxisSize.max,
    children:
    [
      Container(
        height: 120,
        width: 120,
        child: Image(
          fit:BoxFit.cover ,
          image: NetworkImage("${artical["urlToImage"]}"),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      SizedBox(width: 10.0,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text("${artical["title"]}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text("${artical["publishedAt"]}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),

    ],
  ),
);


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


