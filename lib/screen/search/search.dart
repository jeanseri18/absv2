import 'dart:convert';

import 'package:abidjanstreaming/data/model/film.dart';
import 'package:abidjanstreaming/data/services/appurl.dart';
import 'package:abidjanstreaming/screen/home/view/detailmovie.dart';
import 'package:abidjanstreaming/screen/home/view/home_screen.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/custom_style.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:abidjanstreaming/data/trending.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  fetchMovies(String idcategorie) async {
    var url;
    url = await http.get(Uri.parse(
        "https://abidjanstreaming.com/index/api/filmsearch.php?idcategorie=$idcategorie"));

    return json.decode(url.body)['responseData'];
  }

  var rest = '';
  bool isbool = true;
  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: TextFormField(
                style: CustomStyle.textStyle,
                controller: userController,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      isbool = true;
                    });
                  } else {
                    setState(() {
                      rest = value;

                      isbool = false;
                    });
                  }
                  //   print('hrllo');
                },
                decoration: InputDecoration(
                  hintText: 'Que voulez vous regarder ?',
                  //Strings.Nomuser,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                ),
              ),
            ),
            backgroundColor: Colors.black,
            body: FutureBuilder<dynamic>(
                future: fetchMovies(rest),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data["row"].length,
                        itemBuilder: (BuildContext context, int index) {
                          var list = snapshot.data["row"];

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade900,
                                      borderRadius: BorderRadius.circular(15)),
                                  height: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://abidjanstreaming.com/admin/' +
                                                        list[index]['file'],
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                                width: 100,
                                                height: 60,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    list[index]['titre'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '1h20 . 2020-12-1',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 8),
                                                        maxLines: 3,
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.of(context).push(MaterialPageRoute(
                                                                builder: (context) => detailMovie(
                                                                    movie: list[
                                                                        index],
                                                                    id: list[
                                                                            index]
                                                                        ['id'],
                                                                    nomcat: list[
                                                                            index]
                                                                        [
                                                                        'titre'])));
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .navigate_next_sharp,
                                                            color: Colors.white,
                                                          ))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFE65100),
                    ),
                  );
                })));
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(15)),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://abidjanstreaming.com/admin/assets/files/MANDELA.jpg',
                        width: 110,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aladin the prince ',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1h20 . 2020-12-1',
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
