import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:istatistik_hesaplama/core/constants/app_constants.dart';
import 'package:istatistik_hesaplama/core/constants/app_strings.dart';
import 'package:istatistik_hesaplama/core/widgets/help_alert_dialog.dart';

import '../../../../core/models/numbers_model.dart';
import '../../../../core/widgets/snack_bars.dart';

class ModPage extends StatefulWidget {
  ModPage({Key? key}) : super(key: key);

  @override
  State<ModPage> createState() => _ModPageState();
}

class _ModPageState extends State<ModPage> {
  late List<Value> _valueList;

  final TextEditingController _controller = TextEditingController();
  Map<double, int> _degerVeFrekans = {};
  late String result;
  @override
  void initState() {
    super.initState();
    _valueList = <Value>[];
    _valueList.add(Value(id: "1", value: 5));
    _valueList.add(Value(id: "2", value: 3));
    _valueList.add(Value(id: "3", value: 1));
    _valueList.add(Value(id: "4", value: 5));
    _valueList.add(Value(id: "4", value: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Harmonik Ortalama",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return HelpAlertDialog(
                        imagePath: Strings.harmonicImagePath,
                        description: Strings.mainDescription,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.help_outline))
          ],
          centerTitle: false,
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
                        List _array = value.trim().split(" ");
                        for (var i = 0; i < _array.length; i++) {
                          try {
                            var yeniEklenenDeger =
                                Value.create(value: double.parse(_array[i]));
                            _valueList.add(yeniEklenenDeger);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackAlert.showErrorSnackBar(
                                    "Hatalı girdiniz."));
                          }
                        }
                        _array.clear();
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
                        if (_valueList.isNotEmpty) {
                          double total = 0;
                          List<double> _values = [];
                          List _frequency = [];
                          List _datum = [];
                          for (var i = 0; i < _valueList.length; i++) {
                            _values.add(_valueList[i].value);
                          }
                          var map = {};
                          for (var element in _values) {
                            if (!map.containsKey(element)) {
                              map[element] = 1;
                            } else {
                              map[element] += 1;
                            }
                          }
                          _datum = map.keys.toList();
                          _frequency = map.values.toList();
                          print("Medyan Veri Degeri: $_datum");
                          print("Medyan Frekansı: $_frequency");
                          result = "Veri degeri ve frekansı:\n${map}";
                          setState(() {});
                          showResultDialog(context);
                        }
                      },
                      child: const Text(
                        "Hesapla",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: cButtonStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        List _array = _controller.text.trim().split(" ");
                        for (var i = 0; i < _array.length; i++) {
                          try {
                            var yeniEklenenDeger =
                                Value.create(value: double.parse(_array[i]));
                            _valueList.add(yeniEklenenDeger);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackAlert.showErrorSnackBar(
                                    "Hatalı girdiniz."));
                          }
                        }
                        _array.clear();
                        _controller.text = "";
                        setState(() {});
                      },
                      child: const Text(
                        "Ekle",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: cButtonStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _valueList.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var oAnkiListeElemani = _valueList[index];
                        return Dismissible(
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            width: double.infinity,
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Sil",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          key: Key(oAnkiListeElemani.id),
                          onDismissed: (direction) {
                            _valueList.removeAt(index);
                            setState(() {});
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(oAnkiListeElemani.value.toString()),
                          ),
                        );
                      },
                      itemCount: _valueList.length,
                    )
                  : cTextWidgetListEmpty
            ],
          ),
        ));
  }

  showResultDialog(BuildContext context) {
    // Create button
    Widget deletList = TextButton(
      child: const Text("Listeyi Temizle"),
      onPressed: () {
        _valueList = [];
        setState(() {});
        Navigator.of(context).pop();
      },
    );
    Widget backButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Geri"),
    );

    AlertDialog alert = AlertDialog(
      title: const Text(
        "Harmonik Ortalma Sonucu",
        textAlign: TextAlign.center,
      ),
      content: Text(
        result,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      actions: [deletList, backButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

int countFrequency(List<double> list, double element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] == element) {
      count++;
    }
  }

  return count;
}
