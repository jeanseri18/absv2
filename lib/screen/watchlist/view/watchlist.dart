import 'dart:convert';

import 'package:abidjanstreaming/data/model/film.dart';
import 'package:abidjanstreaming/data/services/appurl.dart';
import 'package:abidjanstreaming/screen/home/view/home_screen.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:abidjanstreaming/data/trending.dart';

fetchMovies() async {
  var url;
  url = await http
      .get(Uri.parse("https://abidjanstreaming.com/index/api/filmlist.php"));
  return json.decode(url.body)['responseData'];
}

class WatchListScreen extends StatefulWidget {
  WatchListScreen({Key? key}) : super(key: key);

  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                'Favories',
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            backgroundColor: Colors.black,
            body: FutureBuilder(
                future: fetchMovies(),
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
                          return Text(
                              snapshot.data["row"][index]['id'].toString(),
                              style: TextStyle(color: Colors.amber));
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })));
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://abidjanstreaming.com/admin/assets/files/MANDELA.jpg',
                  width: 110,
                ),
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
                        'Aladin the prince of \n deser00000000000000000000000t',
                        style: TextStyle(color: Colors.white, fontSize: 8),
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
    );
  }
}
