import 'dart:convert';

import 'package:abidjanstreaming/screen/onboard/intro_screen.dart';
import 'package:abidjanstreaming/screen/onboard/on_board_screen.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/custom_style.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/utils/strings.dart';
import 'package:abidjanstreaming/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var email = '';

Future getinfo() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  // setState(() {
  email = preferences.getString('email')!;
  //});
}

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IntroScreen(),
      ),
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController password1Controller = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

  Future mdpupdate() async {
    var mdp = password1Controller.text;
    var mdpnew = password1Controller.text;
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/api/updatemdp.php?mdp=$mdp&mdpnew=$mdpnew&email=$email");
    var response = await http.post(url);
    var data = json.decode(response.body);

    if (data == "success") {
      /* FlutterToast(context).showToast(
          child: Text(=
        'Login Successful',
        style: TextStyle(fontSize: 25, color: Colors.green),
      ));*/
      Fluttertoast.showToast(
          msg: "connexion reuissite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      /*  final snackBar = SnackBar(
          content: const Text('Oups! email ou mot de passe incorrect'),
          action: SnackBarAction(
            label: 'Fermer',
            onPressed: () {
              // Some code to undo the change.
            },
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
      Fluttertoast.showToast(
          msg: data,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    getinfo();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: [
                const Center(
                  child: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.grey,
                    //(0xFFE65100),
                    size: 150,
                  ),
                ),
                textFieldWidget(context),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  textFieldWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 14),
                      backgroundColor: Colors.black

                      //Color(0xFFE65100)
                      ),
                  onPressed: () {
                    logOut(context);
                  },
                  child: Text(
                    'Je me deconnecte ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                email == ' ' ? 'Compte :' : 'Email : ' + email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                'Ancien mot de passe',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: '*************',
                  // Strings.email,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.transparent,

                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.white.withOpacity(0.6),
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.white.withOpacity(0.6),
                          ),
                  ),
                  hintStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                ),
                obscureText: _toggleVisibility,
              ),
              SizedBox(height: Dimensions.heightSize),
              Text(
                'Mot de passe',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: password1Controller,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: '************',
                  //Strings.rePassword,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  filled: true,
                  fillColor: Colors.transparent,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.white.withOpacity(0.6),
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.white.withOpacity(0.6),
                          ),
                  ),
                  hintStyle: CustomStyle.textStyle,
                ),
                obscureText: _toggleVisibility,
              ),
              SizedBox(height: Dimensions.heightSize),
              GestureDetector(
                child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      // CustomColor.accentColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimensions.radius))),
                  child: Center(
                    child: Text(
                      'Modifier mes informations',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.largeTextSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  mdpupdate();
                  password1Controller.text = '';
                  passwordController.text = '';
                },
              )
            ],
          ),
        ));
  }
}
