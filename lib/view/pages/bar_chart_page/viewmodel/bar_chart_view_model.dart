import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../../core/widgets/snack_bars.dart';
import '../models/bar_chart_models.dart';

class BarChart extends StatefulWidget {
  final List<BarChartModels> data;

  const BarChart({Key? key, required this.data}) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late var rendererConfig = charts.BarRendererConfig<num>();

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModels, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: widget.data,
          domainFn: (BarChartModels series, _) => series.name,
          measureFn: (BarChartModels series, _) => series.value,
          colorFn: (BarChartModels series, _) =>
              charts.ColorUtil.fromDartColor(Colors.blueGrey))
    ];
    var size = 100.0;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        height: MediaQuery.of(context).size.height / 1.50,
        width: widget.data.length > 1 ? size * widget.data.length : 250,
        child: Card(
          child: Column(
            children: <Widget>[
              Text(
                "Histogram",
                style: Theme.of(context).textTheme.headline6,
              ),
              widget.data.isNotEmpty
                  ? Expanded(
                      child: charts.BarChart(
                        series,
                        animate: true,
                        selectionModels: [
                          charts.SelectionModelConfig(
                            changedListener: (charts.SelectionModel model) {
                              if (model.hasDatumSelection) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    CustomSnackAlert.showErrorSnackBar(
                                        "Seçilen Çubuğun Adı: " +
                                            model.selectedSeries[0].domainFn(
                                                model.selectedDatum[0].index) +
                                            "\n" +
                                            "\nSeçilen Frekans Değeri: " +
                                            model.selectedSeries[0]
                                                .measureFn(model
                                                    .selectedDatum[0].index)
                                                .toString()));
                              }
                            },
                          )
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 0.01,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
