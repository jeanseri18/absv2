import 'package:abidjanstreaming/screen/auth/sign_up_screen.dart';
import 'package:abidjanstreaming/screen/dashboard_screen.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/custom_style.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/utils/strings.dart';
import 'package:abidjanstreaming/widgets/back_widget.dart';
import 'package:abidjanstreaming/widgets/bg_image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

///demarrer la session verification de donnee
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(
    home: email == null ? SignInScreen() : DashboardScreen(),
  ));
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

  final Duration initialDelay = Duration(seconds: 1);
  bool loading = false;

  Future login() async {
    var url = Uri.parse("https://abidjanstreaming.com/index/testregistre.php");
    var response = await http.post(url, body: {
      "username": emailController.text,
      "password": passwordController.text,
    });
    var data = json.decode(response.body);

    if (data == "Success") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', emailController.text);
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
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      );
    } else {
      final snackBar = SnackBar(
          content: const Text('Oups! email ou mot de passe incorrect'),
          action: SnackBarAction(
            label: 'Fermer',
            onPressed: () {
              // Some code to undo the change.
            },
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      /* Fluttertoast.showToast(
          msg: data,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [bodyWidget(context)],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 200,
              imageUrl:
                  'https://abidjanstreaming.com/admin/assets/files/landscape-desktop.764.430.jpg',
              placeholder: (context, url) => const CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.transparent,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              /* height: 100,
                                                                                                  width: 160,
                                                                                                  fit: BoxFit.contain,*/
              fit: BoxFit.cover,
            ),
            /*   Center(
              child: Image.asset(
                'assets/images/playstore.png',
                width: 100,
              ),
            ),*/
            /*   Center(
              child: Text(''.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),*/

            textFieldWidget(context),
            SizedBox(height: 20),
            signInButtonWidget(context),
            SizedBox(height: Dimensions.heightSize * 2),
            notAMemberWidget(context)
          ],
        ),
      ),
    );
  }

  textFieldWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Connectez vous pour acceder a plus de 200 films'.toUpperCase(),
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoEmail,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  /*  prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.white.withOpacity(0.6),
                    )*/
                ),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Text(
                'Mot de passe',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.password,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                  /*    prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white.withOpacity(0.6),
                  ),*/
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
                ),
                obscureText: _toggleVisibility,
              ),
              SizedBox(height: Dimensions.heightSize),
            ],
          ),
        ));
  }

  signInButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: GestureDetector(
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radius))),
          child: Center(
            child: Text(
              Strings.signIn.toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          /*Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DashboardScreen()));*/
          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
            final snackBar = SnackBar(
                content: const Text('Oups! veuillez saisir le champs manquant'),
                action: SnackBarAction(
                  label: 'Fermer',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            login();
          }
        },
      ),
    );
  }

  notAMemberWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Row(
        children: [
          Text(
            Strings.notAMember,
            style: CustomStyle.textStyle,
          ),
          GestureDetector(
            child: Text(
              Strings.createAccount.toUpperCase(),
              style: TextStyle(
                  color: CustomColor.accentColor, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          )
        ],
      ),
    );
  }
}
