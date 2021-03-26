/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  factory SimpleBarChart.withSampleData() => SimpleBarChart(_createSampleData(), animate: true);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Data, String>> _createSampleData() {
    final data = [
      Data('M', 180),
      Data('T', 280),
      Data('W', 145),
      Data(' T ', 260),
      Data('F', 220),
      Data('S', 155),
      Data(' S ', 285),
    ];

    return [
      charts.Series<Data, String>(
        id: 'Chart',
        areaColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        seriesColor: charts.Color(r: 74, g: 116, b: 203),
        domainFn: (Data data, _) => data.dayOnWeek,
        measureFn: (Data data, _) => data.steps,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class Data {
  final String dayOnWeek;
  final int steps;

  Data(this.dayOnWeek, this.steps);
}
