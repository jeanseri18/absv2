import 'package:abidjanstreaming/screen/onboard/on_board_screen.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OnBoardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Mon profile',
          style: TextStyle(
              fontSize: Dimensions.extraLargeTextSize,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                  size: 150,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(14.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: Colors.grey.shade900),
                onPressed: () {
                  logOut(context);
                },
                child: Text('Deconnexion '),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Abonnement',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Gestion de profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
