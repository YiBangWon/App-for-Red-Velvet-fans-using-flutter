import 'package:Shrine/favorite.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Users Ranking'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        color: Colors.white,
        child: charts.BarChart(
          _createSampleData()
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ForChat, String>> _createSampleData() {
    final data = [
      ForChat('Total number of hotels', 6),
      ForChat('Favorite number of hotels', Favorite.favoriteHotels.length),
    ];

    return [
      charts.Series<ForChat, String>(
        id: 'Hotels',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        areaColorFn: (_,__) => charts.MaterialPalette.white,
        domainFn: (ForChat hotels, _) => hotels.part,
        measureFn: (ForChat hotels, _) => hotels.number,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class ForChat {
  final String part;
  final int number;

  ForChat(this.part, this.number);
}