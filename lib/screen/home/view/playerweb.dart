import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class playerwebabs extends StatefulWidget {
  playerwebabs({Key? key, this.url}) : super(key: key);
  final String? url;

  @override
  _playerwebabsState createState() => _playerwebabsState();
}

class _playerwebabsState extends State<playerwebabs> {
  bool isPaysage = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Future setLandscape() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
  Future setLandscapeNo() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    if (isPaysage) {
      setLandscape();
    }
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    //  print(widget.url! + '\n ++++++++++++++++++++++++++++++++');
    return WillPopScope(
      onWillPop: () async {
        setLandscapeNo();

        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        /*  appBar: AppBar(
          // title: Text("InAppWebView"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              setLandscapeNo();
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
        ),*/
        body: Builder(builder: (BuildContext context) {
          return widget.url!.isNotEmpty
              ? WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                  onProgress: (int progress) {
                    print('WebView is loading (progress : $progress%)');
                  },
                  /* javascriptCshannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },*/
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.startsWith('https://www.youtube.com/')) {
                      print('blocking navigation to $request}');
                      return NavigationDecision.prevent;
                    }
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) {
                    print('Page finished loading: $url');
                  },
                  gestureNavigationEnabled: true,
                  backgroundColor: const Color(0x00000000),
                )
              : WebView(
                  initialUrl:
                      'https://videas.fr/share/190e507b-a240-4438-a5f3-5142064369ec',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                  onProgress: (int progress) {
                    print('WebView is loading (progress : $progress%)');
                  },
                  /* javascriptCshannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },*/
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.startsWith('https://www.youtube.com/')) {
                      print('blocking navigation to $request}');
                      return NavigationDecision.prevent;
                    }
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) {
                    print('Page finished loading: $url');
                  },
                  gestureNavigationEnabled: true,
                  backgroundColor: const Color(0x00000000),
                );
        }),
        /*   floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Container(
              color: Colors.amber,
            ),
          )*/
      ),
    );
  }
}
