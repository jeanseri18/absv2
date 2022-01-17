import 'dart:convert';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Container(),
              title: const Text(
                'Abidjan Streaming',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              //   centerTitle: true,
              /* title: Text(
                'Abidjan streaming'.toUpperCase(),
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),*/
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            backgroundColor: Colors.black,
            body: Container(
              child: FutureBuilder(
                  future: fetchCategorie(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .78,
                            child: ListView.builder(
                                itemCount: snapshot.data["row"].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      if (index == 0)
                                        SizedBox(
                                            height: 250.0,
                                            width: double.infinity,
                                            child: Carousel(
                                              dotBgColor: Colors.transparent,
                                              dotSize: 4.0,
                                              dotSpacing: 15.0,
                                              indicatorBgPadding: 5.0,
                                              dotColor: Colors.grey.shade900,
                                              images: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            'https://abidjanstreaming.com/admin/assets/files/mulan.jpg',
                                                        placeholder: (context,
                                                                url) =>
                                                            const CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.black,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            'https://abidjanstreaming.com/admin/assets/files/The curse of la liorona.jpg',
                                                        placeholder: (context,
                                                                url) =>
                                                            const CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.black,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            'https://abidjanstreaming.com/admin/assets/files/TIMBUKTU.jpg',
                                                        placeholder: (context,
                                                                url) =>
                                                            const CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.black,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            'https://abidjanstreaming.com/admin/assets/files/boogie.jpg',
                                                        placeholder: (context,
                                                                url) =>
                                                            const CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.black,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              ],
                                            )),
                                      if (index != 0)
                                        const SizedBox(
                                          height: 25,
                                        ),
                                      GetFilm(
                                        titre: snapshot.data["row"][index]
                                            ['nom'],
                                        id: snapshot.data["row"][index]['id'],
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )));
  }
}

class GetFilm extends StatelessWidget {
  GetFilm({Key? key, this.titre, this.id}) : super(key: key);
  final titre;
  final id;

  fetchFilm() async {
    var url;

    url = await http.get(Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=$id"));
    return json.decode(url.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titre,
                  style: TextStyle(
                      fontSize: 25,
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
            height: Dimensions.heightSize,
          ),
          Container(
            height: 130,
            child: Expanded(
              child: FutureBuilder(
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
                                  left: Dimensions.marginSize,
                                ),
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: Colors.grey.shade900,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
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
                                                        color: Colors.red,
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
                                                color: Colors.white,
                                                fontSize:
                                                    Dimensions.largeTextSize),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    var desc = list[index]['descr_film'];
                                    var duree = list[index]['dure'];
                                    var date = list[index]['date_ajout'];
                                    showAdaptiveActionSheet(
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
                                            onPressed: () {}),
                                        BottomSheetAction(
                                            title: Container(
                                              padding: EdgeInsets.all(10),
                                              color: Colors.white,
                                              child: Text('Regardez'),
                                            ),
                                            onPressed: () {})
                                      ],
                                      cancelAction: CancelAction(
                                          title:
                                              Container()), // onPressed parameter is optional by default will dismiss the ActionSheet
                                    );
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
