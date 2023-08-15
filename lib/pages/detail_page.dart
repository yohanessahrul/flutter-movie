import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatelessWidget {
  DetailPage({
    super.key,
    // required this.datas,
    required this.imdbID,
    required this.title,
  });

  String imdbID;
  String title;
  String year = '';
  String imdbid = '';
  String poster = '';
  String genre = '';
  String plot = '';

  Future getDetailData() async {
    try {
      var response = await http.get(
        Uri.parse("https://www.omdbapi.com/?i=${imdbID}&apikey=c981ab72"),
      );
      print("detail === ${response.body}");
      Map<String, dynamic> data = json.decode(response.body);
      year = "${data['Year']}";
      imdbid = "${data['imdbID']}";
      poster = "${data['Poster']}";
      genre = "${data['Genre']}";
      plot = "${data['Plot']}";
    } catch (e) {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 150, 111, 39),
      ),
      body: Center(
        child: FutureBuilder(
          future: getDetailData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(
                "Loading...",
                style: TextStyle(fontSize: 23),
              );
            } else {
              return ListView(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 46, 46, 46),
                      image: DecorationImage(
                        // fit: BoxFit.cover,
                        image: NetworkImage(
                          poster,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text("imdbID : ${imdbid}"),
                        Text("Year : ${year}"),
                        Text("Genre : ${genre}"),
                        SizedBox(
                          height: 23,
                        ),
                        Text(plot),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
