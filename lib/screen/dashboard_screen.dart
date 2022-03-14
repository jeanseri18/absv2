import 'dart:io';

import 'package:abidjanstreaming/screen/home/view/home_screen.dart';
import 'package:abidjanstreaming/screen/notification/view/notification.dart';
import 'package:abidjanstreaming/screen/search/search.dart';
import 'package:abidjanstreaming/screen/watchlist/view/watchlist.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:search_page/search_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isPaysage = true;

  Future setLandscapeNo() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);

  // int currentIndex = 1;
  int currentPage = 0;
  final _pageController = PageController();
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    if (isPaysage) {
      setLandscapeNo();
    }
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomBar(
        selectedIndex: currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => currentPage = index);
          goToScreen(currentPage);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Acceuil'),
            activeColor: CustomColor.yellowLightColor,
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favories'),
            activeColor: CustomColor.yellowLightColor,
            darkActiveColor: CustomColor.yellowLightColor, // Optional
          ),
          BottomBarItem(
            icon: Icon(Icons.search),
            title: Text('Recherche'),
            activeColor: CustomColor.yellowLightColor,
            darkActiveColor: CustomColor.yellowLightColor, // Optional
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Compte'),
            activeColor: CustomColor.yellowLightColor,
            darkActiveColor: CustomColor.yellowLightColor, // Optional
          ),
          /*  BottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('Parametre'),
            activeColor: Colors.orange,
          ),*/
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          goToScreen(currentPage),
          goToScreen(currentPage),
          goToScreen(currentPage),
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => currentPage = index);
        },
      ),
    );
  }

  goToScreen(int currentIndex) {
    print('indexx: $currentIndex');
    switch (currentIndex) {
      case 1:
        return WatchListScreen();
      case 0:
        return HomeScreen();
      case 2:
        return SearchScreen();
      case 3:
        return NotificationScreen();
    }
  }
}
