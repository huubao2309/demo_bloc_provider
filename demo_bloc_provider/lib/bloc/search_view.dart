import 'package:demo_bloc_provider/bloc/search_bloc.dart';
import 'package:demo_bloc_provider/bloc/search_box.dart';
import 'package:demo_bloc_provider/bloc/search_list_result.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SearchBox(
            bloc: searchBloc,
          ),
          Expanded(
            child: ResultSearch(
              bloc: searchBloc,
            ),
          )
        ],
      ),
    );
  }
}
