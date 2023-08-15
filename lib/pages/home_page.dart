import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import './tabs/tabs_film.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  // Map<String, dynamic> dataBatman;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Text("WatchList"),
      TabFilms(),
      Text("Profile"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sobat Movies",
          style: TextStyle(color: Colors.black),
        ),
        // backgroundColor: Colors.orange[800],
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.orange[900],
        activeColor: Colors.white,
        items: [
          TabItem(icon: Icons.list_alt_outlined, title: 'Watchlist'),
          TabItem(icon: Icons.movie_creation_outlined, title: 'Movies'),
          TabItem(icon: Icons.account_circle_outlined, title: 'Profile'),
        ],
        initialActiveIndex: 1,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
