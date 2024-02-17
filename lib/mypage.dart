import 'package:Shrine/favorite.dart';
import 'package:Shrine/model/product.dart';
import 'package:Shrine/model/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels Carousel Slider'),
        centerTitle: true,
      ),
      body: Favorite.favoriteHotels.isEmpty ? Container() : CarouselSlider(
        height: 400.0,
        autoPlay: true,
        autoPlayInterval: const Duration(milliseconds: 300),
        items: ProductsRepository.loadProducts(Category.all)
        .where((p) => Favorite.favoriteHotels.contains(p.name))
        .map((product) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(product.assetName),
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                    ),
                  )
                ]
              );
            },
          );
        }).toList(),
      ),
    );
  }
}