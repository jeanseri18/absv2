import 'package:abidjanstreaming/screen/auth/sign_in_screen.dart';
import 'package:abidjanstreaming/screen/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/utils/strings.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.heightSize * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/playstore.png',
                width: 150,
              ),
              SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.marginSize * 2,
                    right: Dimensions.marginSize * 2),
                child: Text(
                  Strings.startByCreatingAccount.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize * 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Dimensions.heightSize),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.marginSize * 2,
                    right: Dimensions.marginSize * 2),
                child: Text(
                  Strings.introSubTitle,
                  style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: Dimensions.heightSize * 6,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.marginSize * 2,
                    right: Dimensions.marginSize * 2),
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: CustomColor.accentColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Center(
                      child: Text(
                        Strings.createAnAccount.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                ),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.marginSize * 2,
                    right: Dimensions.marginSize * 2),
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: CustomColor.secondaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Center(
                      child: Text(
                        Strings.signIn.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
