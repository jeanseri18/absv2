import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/utils/strings.dart';
import 'package:abidjanstreaming/widgets/bg_image_widget.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'intro_screen.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            itemCount: totalPages,
            itemBuilder: (context, index) {
              OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
              return Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      //   BgImageWidget(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Dimensions.heightSize,
                          bottom: Dimensions.heightSize * 8,
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              oi.image,
                              //fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: Dimensions.heightSize * 2,
                            ),
                            Text(
                              oi.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.extraLargeTextSize,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: Dimensions.heightSize * 1,
                            ),
                            Text(
                              oi.subTitle,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: Dimensions.largeTextSize,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: Dimensions.heightSize * 3,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: index != (totalPages - 1)
                                    ? Container(
                                        width: 100.0,
                                        height: 12.0,
                                        child: ListView.builder(
                                          itemCount: totalPages,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Container(
                                                width: index == i ? 12 : 12.0,
                                                decoration: BoxDecoration(
                                                    color: index == i
                                                        ? CustomColor
                                                            .accentColor
                                                        : CustomColor
                                                            .secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                6.0))),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : GestureDetector(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: 50,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                color: CustomColor.accentColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        Dimensions.radius *
                                                            0.5))),
                                            child: Center(
                                              child: Text(
                                                Strings.getStarted
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .largeTextSize,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      IntroScreen()));
                                        },
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
