import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {

  static List<String> favoriteHotels = [];

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Hotels'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Favorite.favoriteHotels.length,
        itemBuilder: (context, index){
          return Dismissible(
            key: Key(Favorite.favoriteHotels[index]),
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(Favorite.favoriteHotels[index]),
            ),
            onDismissed: (_) => Favorite.favoriteHotels.removeAt(index),
          );
        }
      )
    );
  }
}