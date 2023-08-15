import 'package:flutter/material.dart';
import '../../components/top_home_production_row.dart';
import '../../components/top_list_row.dart';

class TabFilms extends StatefulWidget {
  const TabFilms({
    super.key,
  });

  @override
  State<TabFilms> createState() => _TabFilmsState();
}

class _TabFilmsState extends State<TabFilms> {
  // print(dataBatman);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: ListView(
        children: [
          TopHomeProduction(),
          TopListPoster(titleOfList: "Top 10 Batman", keySearch: "batman"),
          TopListPoster(titleOfList: "Horor Movie", keySearch: "horror"),
          SizedBox(
            height: 40,
          ),
          Container(
            color: Color.fromARGB(255, 237, 219, 138),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 50,
              ),
              child: TopListPoster(
                  titleOfList: "Best of Anime", keySearch: "anime"),
            ),
          ),
        ],
      ),
    );
  }
}
