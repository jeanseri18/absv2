import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              //   centerTitle: true,
              title: Text(
                'Abidjan streaming',
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            backgroundColor: Colors.black,
            body: CustomScrollView(slivers: <Widget>[])));
  }
}
