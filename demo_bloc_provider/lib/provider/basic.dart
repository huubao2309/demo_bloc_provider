import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// Exposing a value
class User {
  // Không extends or with ChangeNotifer
  String _name;

  String get name => _name;
  set name(newName) => _name = newName;
}

class BasicProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = User();
    user.name = "Bill Nguyen";

    return Provider<User>.value(
      value: user,
      child: BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          DemoConsumerWidget(),
          DemoWithoutConsumerWidget(),
        ],
      ),
    );
  }
}

class DemoConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Cách 1: use Consumer
    return Consumer<User>(
      builder: (context, user, child) => Text(user.name),
    );
  }
}

class DemoWithoutConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Cach 2: Use Provider.of()
    User user = Provider.of<User>(context);
    return Container(
      child: Text(user.name),
    );
  }
}
