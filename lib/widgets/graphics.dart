
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

LineSeries lineSeriesPosition(BuildContext context, String clubName, List<ClassificationData> dataSource, Color color, Function(ChartPointDetails) onTap){
  return LineSeries<ClassificationData, String>(
    onPointLongPress: onTap,
    xAxisName: Translation(context).text.years,
    yAxisName: Translation(context).text.position,
    color: color,
    name: clubName,
    dataSource: dataSource,
    enableTooltip: true,
    xValueMapper: (ClassificationData data, _) =>
    //Para mostrar apertura e clausura
    data.year.toString().substring(5) == '5'
        ? data.year.toString() //ano.5 -> ano.5
        : data.year.toInt().toString(),
    //ano.0 -> ano
    yValueMapper: (ClassificationData data, _) => data.position,
    dataLabelSettings: const DataLabelSettings(
        isVisible: true, color: Colors.white),
    markerSettings: const MarkerSettings(
        isVisible: true,
        height: 4,
        width: 4,
        borderWidth: 3,
        borderColor: Colors.white
    ),
  );
}