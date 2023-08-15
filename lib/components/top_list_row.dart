import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../pages/detail_page.dart';

class TopListPoster extends StatelessWidget {
  TopListPoster({
    super.key,
    required this.titleOfList,
    required this.keySearch,
  });

  final String titleOfList;
  final String keySearch;

  final List<Map<String, dynamic>> allData = [];

  Future getData() async {
    try {
      var response = await http.get(
        Uri.parse("https://www.omdbapi.com/?s=${keySearch}&apikey=c981ab72"),
      );
      List data =
          (json.decode(response.body) as Map<String, dynamic>)['Search'];
      data.forEach((element) {
        allData.add(element);
      });
      // print("${keySearch} === ${allData}");
    } catch (e) {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleOfList,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(
                              right: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(
                              right: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(
                              right: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(14),
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: allData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                imdbID: allData[index]['imdbID'],
                                title: allData[index]['Title'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(
                            right: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "${allData[index]['Poster']}",
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
