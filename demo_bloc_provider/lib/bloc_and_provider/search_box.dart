import 'package:demo_bloc_provider/bloc_and_provider/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBoxNew extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBoxNew> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // get bloc on context
    var bloc = Provider.of<SearchBlocProvider>(context);
    searchController.addListener(() {
      bloc.search(searchController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBlocProvider>(
      builder: (context, bloc, child) => Container(
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
      ),
    );
  }
}
