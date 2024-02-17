
import 'package:Shrine/chart.dart';
import 'package:Shrine/favorite.dart';
import 'package:Shrine/home.dart';
import 'package:Shrine/mypage.dart';
import 'package:Shrine/search.dart';
import 'package:flutter/material.dart';

const String routeHome = '/home';
const String routeSearch = '/search';
const String routeFavoriteHotel = '/favorite_hotel';
const String routeRanking = '/ranking';
const String routeMyPage = 'my_page';

Map<String, WidgetBuilder> routes = {
  routeHome: (_) => Home(),
  routeSearch: (_) => Search(),
  routeFavoriteHotel: (_) => Favorite(),
  routeRanking: (_) => Chart(),
  routeMyPage: (_) => MyPage()
};