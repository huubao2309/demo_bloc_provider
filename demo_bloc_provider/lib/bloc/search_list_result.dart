import 'package:demo_bloc_provider/bloc/search_bloc.dart';
import 'package:flutter/material.dart';

class ResultSearch extends StatefulWidget {
  final SearchBloc bloc;
  ResultSearch({SearchBloc bloc}) : this.bloc = bloc;
  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<String>>(
          initialData: [],
          stream: widget.bloc.searchController.stream,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _buildRow(snapshot.data[index]);
                });
          }),
    );
  }

  Widget _buildRow(String data) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        data,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
