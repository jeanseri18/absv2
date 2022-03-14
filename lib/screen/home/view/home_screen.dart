import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:abidjanstreaming/data/film.dart';
import 'package:abidjanstreaming/data/model/ResultModel.dart';
import 'package:abidjanstreaming/data/model/film.dart';
import 'package:abidjanstreaming/screen/home/view/detailmovie.dart';
import 'package:abidjanstreaming/screen/home/view/playerweb.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/utils/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

final List<String> sliderList = [
  'https://abidjanstreaming.com/admin/assets/files/mulan.jpg',
  'https://abidjanstreaming.com/admin/assets/files/The curse of la liorona.jpg',
  'https://abidjanstreaming.com/admin/assets/files/TIMBUKTU.jpg',
  'https://abidjanstreaming.com/admin/assets/files/boogie.jpg',
];

//'assets/images/slider/3.png',

fetchCategorie() async {
  var url;
  url = await http
      .get(Uri.parse("https://abidjanstreaming.com/index/api/categorie.php"));
  return json.decode(url.body)['responseData'];
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamController<ResultModel> _streamController = StreamController();
  @override
  void dispose() {
    // stop streaming when app close
    _streamController.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // A Timer method that run every 3 seconds
    // Timer.periodic(Duration(seconds: 360), (timer) {

    getCryptoPrice();
    //});
  }

  // a future method that fetch data from API
  Future<void> getCryptoPrice() async {
    var url = Uri.parse("https://abidjanstreaming.com/index/api/categorie.php");
    final response = await http.get(url);
    final databody = json.decode(response.body);
    ;
    ResultModel dataModel = ResultModel.fromJSON(databody);
    print('ok');
    // add API response to stream controller sink
    _streamController.sink.add(dataModel);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Container(
                width: 1,
              ),
              centerTitle: true,
              title: Image.asset(
                'assets/images/suite.png',
                width: 150,
              ),
              //   centerTitle: true,
              /* title: Text(
                'Abidjan streaming'.toUpperCase(),
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),*/
              /* actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],*/
            ),
            backgroundColor: Colors.black,
            body: Container(
              child: StreamBuilder<ResultModel>(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }
                    if (snapshot.hasData) {
                      print(snapshot.data!.responsedata['row']);
                      print('ok');
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .78,
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      if (index == 0)
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SizedBox(
                                              height: 220.0,
                                              width: double.infinity,
                                              child: Carousel(
                                                dotBgColor: Colors.transparent,
                                                dotSize: 4.0,
                                                dotSpacing: 15.0,
                                                indicatorBgPadding: 5.0,
                                                dotColor: Color(0xFFE65100),
                                                images: [
                                                  Stack(children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/banierepaysasge1.jpg',
                                                              // width: 200,
                                                            ),
                                                            /*  CachedNetworkImage(
                                                              height: 200,
                                                              imageUrl:
                                                                  'https://abidjanstreaming.com/admin/assets/files/tout simplement Noir.jpg',
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const CircularProgressIndicator(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                              /* height: 100,
                                                                                                  width: 160,
                                                                                                  fit: BoxFit.contain,*/
                                                              fit: BoxFit.cover,
                                                            )*/
                                                            /*     Container(
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .transparent
                                                                            .withOpacity(1.0),
                                                                        Color(0xFFE65100)
                                                                            .withOpacity(1.0),
                                                                      ],
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      stops: [
                                                                        0.1,
                                                                        0.9
                                                                      ]),
                                                            ),
                                                          )*/
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ]),
                                                  Stack(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/banierepaysasge2.jpg',
                                                              // width: 200,
                                                            ),
                                                            /*   CachedNetworkImage(
                                                              height: 200,
                                                              imageUrl:
                                                                  'https://abidjanstreaming.com/admin/assets/files/Machine gun preacher.jpg',
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const CircularProgressIndicator(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                              /* height: 100,
                                                                                                  width: 160,
                                                                                                  fit: BoxFit.contain,*/
                                                              fit: BoxFit.cover,
                                                            )*/
                                                            /*  Container(
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .transparent
                                                                            .withOpacity(1.0),
                                                                        Color(0xFFE65100)
                                                                            .withOpacity(1.0),
                                                                      ],
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      stops: [
                                                                        0.1,
                                                                        0.9
                                                                      ]),
                                                            ),
                                                          )*/
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ]),
                                                  Stack(children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/banierepaysasge3.jpg',
                                                              // width: 200,
                                                            ),
                                                            /*CachedNetworkImage(
                                                              height: 200,
                                                              imageUrl:
                                                                  'https://abidjanstreaming.com/admin/assets/files/landscape-desktop.764.430.jpg',
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const CircularProgressIndicator(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                              /* height: 100,
                                                                                                  width: 160,
                                                                                                  fit: BoxFit.contain,*/
                                                              fit: BoxFit.cover,
                                                            ),*/
                                                            /*  Container(
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .transparent
                                                                            .withOpacity(1.0),
                                                                        Color(0xFFE65100)
                                                                            .withOpacity(1.0),
                                                                      ],
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment
                                                                          .topCenter,
                                                                      stops: [
                                                                        0.1,
                                                                        0.9
                                                                      ]),
                                                            ),
                                                          )*/
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ]),
                                                ],
                                              )),
                                        ),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Action'],
                                          titre: 'Action',
                                          id: 6),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Anime'],
                                          titre: 'Anime',
                                          id: 16),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Aventure'],
                                          titre: 'Aventure',
                                          id: 17),
                                      getfilmcategorie(
                                          data: snapshot
                                                  .data!.responsedata!['row']
                                              ['Biographie'],
                                          titre: 'Biographie',
                                          id: 15),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Comedie'],
                                          titre: 'Comedie',
                                          id: 4),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Crime'],
                                          titre: 'Crime',
                                          id: 18),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Drame'],
                                          titre: 'Drame',
                                          id: 3),
                                      getfilmcategorie(
                                          data: snapshot
                                                  .data!.responsedata!['row']
                                              ['Fantastique'],
                                          titre: 'Fantastique',
                                          id: 7),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Horreur'],
                                          titre: 'Horreur',
                                          id: 8),
                                      getfilmcategorie(
                                          data: snapshot
                                                  .data!.responsedata!['row']
                                              ['Science fiction'],
                                          titre: 'Science fiction',
                                          id: 7),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Manga'],
                                          titre: 'Manga',
                                          id: 21),
                                      getfilmcategorie(
                                          data: snapshot.data!
                                              .responsedata!['row']['Thriller'],
                                          titre: 'Thriller',
                                          id: 7)
                                      /*  GetFilm(
                                        titre: snapshot.data!
                                            .responsedata["row"][index]['nom'],
                                        id: snapshot.data!.responsedata["row"]
                                            [index]['id'],
                                      )*/
                                    ],
                                  );
                                }),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFE65100),
                      ),
                    );
                  }),
            )));
  }
}

class getfilmcategorie extends StatefulWidget {
  getfilmcategorie({Key? key, this.data, this.titre, this.id})
      : super(key: key);
  final data;
  final titre;
  final id;

  @override
  State<getfilmcategorie> createState() => _getfilmcategorieState();
}

class _getfilmcategorieState extends State<getfilmcategorie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.titre,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                /*Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),*/
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: Expanded(
                child: ListView.builder(
              itemCount: widget.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                List list = widget.data;

                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: GestureDetector(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://abidjanstreaming.com/admin/' +
                                          list[index]['file'],
                                  errorWidget: (context, url, error) =>
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 14,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE65100),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Center(
                                        child: Text(
                                          'HD',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.smallTextSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: CustomColor.accentColor,
                                          size: 15,
                                        ),
                                        Text(
                                          list[index]['id'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold),
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
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Text(
                              list[index]['titre'],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Dimensions.largeTextSize),
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
                                      fontSize: Dimensions.largeTextSize),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  list[index]['date_ajout'],
                                  style: TextStyle(
                                      color: Colors.white24,
                                      fontSize: Dimensions.largeTextSize),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => detailMovie(
                              movie: list[index],
                              id: widget.id,
                              nomcat: widget.titre)));
                    },
                  ),
                );
              },
            )),
          )
        ],
      ),
    );
  }
}

class GetFilm extends StatefulWidget {
  GetFilm({Key? key, this.titre, this.id}) : super(key: key);
  final titre;
  final id;

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
          Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.titre,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                /*Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),*/
              ],
            ),
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
                                                nomcat: widget.titre)));
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
