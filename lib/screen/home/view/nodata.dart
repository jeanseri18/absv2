import 'package:abidjanstreaming/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

class nodata extends StatelessWidget {
  const nodata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ),
            );
          },
          child: Text(
            'data',
            style: TextStyle(color: Colors.amber),
          )),
    );
  }
}
