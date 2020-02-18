import 'package:demo_bloc_provider/bloc_and_provider/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultSearchNew extends StatefulWidget {
  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearchNew> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBlocProvider>(
      builder: (context, bloc, child) => Container(
        child: StreamBuilder<List<String>>(
            initialData: [],
            stream: bloc.searchController.stream,
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return _buildRow(snapshot.data[index]);
                  });
            }),
      ),
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
