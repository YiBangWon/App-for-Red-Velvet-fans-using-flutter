import 'package:Shrine/favorite.dart';
import 'package:Shrine/model/product.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {

  final Product product;

  Detail({Key key, this.product}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        centerTitle: true
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.product.assetName,
            child: Stack(
              children: [
                Image(
                  image: AssetImage(widget.product.assetName),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.5,
                ),
                Positioned(
                  right: 80.0,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(Favorite.favoriteHotels.contains(widget.product.name) 
                      ? Icons.favorite : Icons.favorite_border,color: Colors.red),
                      onPressed: () => setState(() {
                        Favorite.favoriteHotels.contains(widget.product.name) ? Favorite.favoriteHotels.remove(widget.product.name)
                        : Favorite.favoriteHotels.add(widget.product.name);
                      }),
                    ),
                  ),
                )
              ]
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow),
                    Icon(Icons.star,color: Colors.yellow),
                    Icon(Icons.star,color: Colors.yellow)
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.product.name,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.location_on,color: Colors.blue),
                    SizedBox(width: 10.0),
                    Text(
                      widget.product.location,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone,color: Colors.blue),
                    SizedBox(width: 10.0),
                    Text(
                      widget.product.phone,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 2.0,
                  width: MediaQuery.of(context).size.width*0.9,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.product.description,
                  style: TextStyle(
                    color: Colors.blue
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}