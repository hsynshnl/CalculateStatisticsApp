import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:istatistik_hesaplama/core/constants/app_constants.dart';
import 'package:istatistik_hesaplama/core/widgets/app_bar.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/snack_bars.dart';
import '../models/bar_chart_models.dart';
import '../viewmodel/bar_chart_view_model.dart';

class BarChartPage extends StatefulWidget {
  const BarChartPage({Key? key}) : super(key: key);

  @override
  State<BarChartPage> createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  final TextEditingController _valueTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  late List<BarChartModels> data = [];
  @override
  void initState() {
    super.initState();
    data = <BarChartModels>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        imagePath: Strings.chartImagePath,
        title: Strings.chartTitle,
        description: Strings.chartDescription,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            data.isNotEmpty
                ? BarChart(
                    data: data,
                  )
                : cTextWidgetListEmpty,
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _nameTextController,
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      try {
                        if (_nameTextController.text.isNotEmpty &&
                            _valueTextController.text.isNotEmpty) {
                          data.add(BarChartModels.create(
                              value: int.parse(_valueTextController.text),
                              name: value));
                          _nameTextController.text = "";
                          _valueTextController.text = "";
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackAlert.showErrorSnackBar(
                                  "Hatalı girdiniz."));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackAlert.showErrorSnackBar(
                                "Hatalı girdiniz."));
                      }

                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: const InputDecoration(
                        hintText: "Adı",
                        filled: true,
                        focusColor: Colors.blueGrey,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey))),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('^[0-9.]*')),
                    ],
                    controller: _valueTextController,
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      try {
                        if (_nameTextController.text.isNotEmpty &&
                            _valueTextController.text.isNotEmpty) {
                          data.add(BarChartModels.create(
                              value: int.parse(_valueTextController.text),
                              name: _nameTextController.text));
                          _nameTextController.text = "";
                          _valueTextController.text = "";
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackAlert.showErrorSnackBar(
                                  "Hatalı girdiniz."));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackAlert.showErrorSnackBar(
                                "Hatalı girdiniz."));
                      }

                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: cInputDecoration,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        if (_nameTextController.text.isNotEmpty &&
                            _valueTextController.text.isNotEmpty) {
                          data.add(BarChartModels.create(
                              value: int.parse(_valueTextController.text),
                              name: _nameTextController.text));
                          _nameTextController.text = "";
                          _valueTextController.text = "";
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackAlert.showErrorSnackBar(
                                  "Hatalı girdiniz."));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackAlert.showErrorSnackBar(
                                "Hatalı girdiniz."));
                      }

                      setState(() {});
                    },
                    child: cButtonText("Ekle"),
                    style: cButtonStyle,
                  ),
                ),
                data.isNotEmpty
                    ? TextButton(
                        onPressed: () {
                          data.clear();
                          setState(() {});
                        },
                        child: cButtonText("Temizle"),
                      )
                    : const SizedBox(
                        height: 0.01,
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
