import 'dart:convert';
import 'dart:io';

import 'package:abidjanstreaming/screen/home/view/playerweb.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class detailMovie extends StatefulWidget {
  detailMovie({Key? key, this.movie, this.id, this.nomcat}) : super(key: key);
  final movie;
  final id;
  final nomcat;

  @override
  State<detailMovie> createState() => _detailMovieState();
}

class _detailMovieState extends State<detailMovie> {
  fetchmovieinsert(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var email = preferences.getString('email')!;

    var url;
    url = await http.get(Uri.parse(
        "https://abidjanstreaming.com/index/api/insertfavorisbyemail.php?id=$id&t=film&email=$email"));
    var data = json.decode(url.body);

    print(
        "https://abidjanstreaming.com/index/api/insertfavorisbyemail.php?id=$id&t=film&email=$email");

    if (data == "success") {
      /* FlutterToast(context).showToast(
          child: Text(=
        'Login Successful',
        style: TextStyle(fontSize: 25, color: Colors.green),
      ));*/
      final snackBar = SnackBar(
          content: const Text('Ce film a ete ajoute au favoris'),
          action: SnackBarAction(
            label: 'Fermer',
            onPressed: () {
              // Some code to undo the change.
            },
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
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

  /*bool isPaysage = true;

  Future setLandscapeNo() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);

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
  }*/

  @override
  Widget build(BuildContext context) {
    var desc = widget.movie['descr_film'];
    var duree = widget.movie['dure'];
    var date = widget.movie['date_ajout'];
    var titre = widget.movie['titre'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Detail ',
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: CachedNetworkImage(
                        imageUrl: 'https://abidjanstreaming.com/admin/' +
                            widget.movie['file'],
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.contain,
                        height: 180.0,
                      )),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(width: 4),
                      Image.asset(
                        'assets/images/plateforme.png',
                        width: 30,
                      ),
                      Text(
                        ' F I L M',
                        style: const TextStyle(
                          color: Color(0xFFE65100),
                          //(0xFFE65100),
                          fontSize: 15.00,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: 40,
                        maxWidth: MediaQuery.of(context).size.width),
                    child: Text(
                      ' ${titre} ',
                      style: const TextStyle(
                          color: Colors.white,
                          //(0xFFE65100),
                          fontSize: 25.00,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade),
                      maxLines: 1,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ' \n Duree: ${duree}     Date d ajout: ${date} ',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.00,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      )),
                  SizedBox(height: 10),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFE65100),
                          borderRadius: BorderRadius.circular(0)),
                      height: 40,
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      child: TextButton(
                          child: Text(
                            'Regardez maintenant',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.00,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => playerwebabs(
                                  url: widget.movie['url'],
                                ),
                              ),
                            );
                          })),
                  SizedBox(height: 10),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0)),
                      height: 40,
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      child: TextButton(
                          child: Text(
                            'Ajoutez a ma liste',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.00,
                            ),
                          ),
                          onPressed: () {
                            fetchmovieinsert(widget.movie['id']);
                          })),
                  SizedBox(height: 10),
                  Text(
                    ' ${desc} ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 15),

                  //  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        ' similaire ',
                        style: const TextStyle(
                          color: Colors.grey,
                          //(0xFFE65100),
                          fontSize: 25.00,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GetFilm(
                    id: widget.id,
                    nomcat: widget.nomcat,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GetFilm extends StatefulWidget {
  GetFilm({Key? key, this.id, this.nomcat}) : super(key: key);

  final id;
  final nomcat;

  @override
  State<GetFilm> createState() => _GetFilmState();
}

class _GetFilmState extends State<GetFilm> {
  fetchFilm() async {
    var url;

    url = await http.get(Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=${widget.id}"));
    return json.decode(url.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: Expanded(
              child: FutureBuilder<dynamic>(
                  future: fetchFilm(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              List list = snapshot.data;

                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: GestureDetector(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://abidjanstreaming.com/admin/' +
                                                        list[index]['file'],
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                                height: 100,
                                                width: 180,
                                                fit: BoxFit.contain,
                                              ),
                                            )

                                            /* Container(
                                              
                                              
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://abidjanstreaming.com/admin/' +
                                                        list[index]['file'],
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(
                                                  backgroundColor: Colors.black,
                                                  color: Colors.transparent,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                                height: 100,
                                                width: 170,
                                                fit: BoxFit.contain,
                                              ),
                                            )*/
                                            ,
                                            Positioned(
                                              right: 5,
                                              top: 0,
                                              left: 5,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 14,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE65100),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                    child: Center(
                                                      child: Text(
                                                        'HD',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .smallTextSize,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: CustomColor
                                                            .accentColor,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        list[index]['id'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: Dimensions
                                                                .defaultTextSize,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: Dimensions.heightSize * 0.5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, right: 4),
                                          child: Text(
                                            list[index]['titre'],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.largeTextSize),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, right: 4, top: 4),
                                          child: Row(
                                            children: [
                                              Text(
                                                list[index]['dure'],
                                                style: TextStyle(
                                                    color: Colors.white24,
                                                    fontSize: Dimensions
                                                        .largeTextSize),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                list[index]['date_ajout'],
                                                style: TextStyle(
                                                    color: Colors.white24,
                                                    fontSize: Dimensions
                                                        .largeTextSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    var desc = list[index]['descr_film'];
                                    var duree = list[index]['dure'];
                                    var date = list[index]['date_ajout'];
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => detailMovie(
                                                movie: list[index],
                                                id: widget.id,
                                                nomcat: widget.nomcat)));
                                    /*    showAdaptiveActionSheet(
                                      bottomSheetColor: Colors.grey.shade900,
                                      context: context,

                                      androidBorderRadius: 30,
                                      actions: <BottomSheetAction>[
                                        BottomSheetAction(
                                            title: Column(
                                              children: [
                                                Text(
                                                  '\n Detail du film \n \n  ${desc} \n \n Duree: ${duree}      Date d ajout: ${date}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11.00,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              log("${list[index]['file']}");
                                            }),
                                        BottomSheetAction(
                                            title: Container(
                                              padding: EdgeInsets.all(10),
                                              color: Color(0xFFE65100),
                                              child: Text('Regardez'),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      playerwebabs(
                                                    url: list[index]['url'],
                                                  ),
                                                ),
                                              );
                                            })
                                      ],
                                      cancelAction: CancelAction(
                                          title:
                                              Container()), // onPressed parameter is optional by default will dismiss the ActionSheet
                                    );*/
                                  },
                                ),
                              );
                            },
                          )
                        : CircularProgressIndicator(
                            color: Colors.black,
                          );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
