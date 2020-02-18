import 'package:demo_bloc_provider/bloc_and_provider/search_bloc.dart';
import 'package:demo_bloc_provider/bloc_and_provider/search_box.dart';
import 'package:demo_bloc_provider/bloc_and_provider/search_list_result.dart';
import 'package:flutter/material.dart';

class SearchViewNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SearchBoxNew(),
          Expanded(
            child: ResultSearchNew(),
          )
        ],
      ),
    );
  }
}
