import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:istatistik_hesaplama/core/constants/app_constants.dart';
import 'package:istatistik_hesaplama/core/functions/calculate.dart';
import 'package:istatistik_hesaplama/core/functions/list_add.dart';
import 'package:istatistik_hesaplama/core/widgets/app_bar.dart';
import 'package:istatistik_hesaplama/core/widgets/result_alert_dialog.dart';
import 'package:istatistik_hesaplama/core/widgets/value_list_builder.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/models/numbers_model.dart';

class GeometricPage extends StatefulWidget {
  GeometricPage({Key? key}) : super(key: key);

  @override
  State<GeometricPage> createState() => _GeometricPageState();
}

class _GeometricPageState extends State<GeometricPage> {
  late List<Value> _valueList;
  final TextEditingController _controller = TextEditingController();
  num result = 0;
  @override
  void initState() {
    super.initState();
    _valueList = <Value>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.geometricTitle,
        description: Strings.mainDescription,
        imagePath: Strings.geometricImagePath,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('^[0-9 .]*')),
                    ],
                    controller: _controller,
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      _valueList.addAll(ListAdd.listAdd(value, context));
                      _controller.text = "";
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: cInputDecoration,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _valueList
                          .addAll(ListAdd.listAdd(_controller.text, context));
                      _controller.text = "";

                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      setState(() {});
                    },
                    child: cButtonText("Ekle"),
                    style: cButtonStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      result = Calculate.geometricResult(_valueList);
                      setState(() {});
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ResultAlertDialog(result: "$result");
                          });
                    },
                    child: cButtonText("Hesapla"),
                    style: cButtonStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _valueList.isNotEmpty
                    ? TextButton(
                        onPressed: () {
                          _valueList.clear();
                          setState(() {});
                        },
                        child: cButtonText("Temizle"),
                      )
                    : const SizedBox(
                        height: 0.01,
                      ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _valueList.isNotEmpty
                ? ValueListBuilder(valueList: _valueList)
                : cTextWidgetListEmpty
          ],
        ),
      ),
    );
  }
}
