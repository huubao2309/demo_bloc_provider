import 'package:demo_bloc_provider/bloc/search_bloc.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final SearchBloc bloc;
  SearchBox({SearchBloc bloc}) : this.bloc = bloc;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      widget.bloc.search(searchController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
          ),
          hintText: 'Input Text',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
