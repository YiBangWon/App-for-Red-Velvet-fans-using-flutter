import 'package:Shrine/detail.dart';
import 'package:Shrine/model/product.dart';
import 'package:Shrine/model/products_repository.dart';
import 'package:Shrine/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 8,
              child: Hero(
                tag: product.assetName,
                child: Image.asset(
                  product.assetName,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Icon(Icons.star,color: Colors.yellow),
                        Icon(Icons.star,color: Colors.yellow),
                        Icon(Icons.star,color: Colors.yellow)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Text(
                          product.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.location_on,color: Colors.blue)
                        ),
                        Text(
                          product.location,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Detail(product: product)
                          )),
                          child: Text(
                            'more',
                            style: TextStyle(
                              color: Colors.blue
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),onPressed: ()
          => _scaffoldKey.currentState.openDrawer()),
        title: Text('Main'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search),onPressed: ()
            => Navigator.pushNamed(context, routeSearch)),
          IconButton(icon: Icon(Icons.tune),onPressed: (){})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text(
                    'Pages',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25.0
                    ),
                  ),
                  SizedBox(height: 10.0)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home,color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, routeHome);
              }
            ),
            ListTile(
              title: Text('Search'),
              leading: Icon(Icons.search,color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, routeSearch);
              },
            ),
            ListTile(
              title: Text('Favorite Hotel'),
              leading: Icon(Icons.location_city,color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, routeFavoriteHotel);
              }
            ),
            ListTile(
              title: Text('Ranking'),
              leading: Icon(Icons.insert_chart,color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, routeRanking);
              }
            ),
            ListTile(
              title: Text('My Page'),
              leading: Icon(Icons.person,color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, routeMyPage);
              },
            )
          ]
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return GridView.count(
            crossAxisCount: orientation==Orientation.portrait ? 2 : 3,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0/9.0,
            children: _buildGridCards(context),
          );
        }
      ),
    );
  }
}
