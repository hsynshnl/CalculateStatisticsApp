import 'package:istatistik_hesaplama/view/pages/mod_page/view/mod_page.dart';

import '../../../pages/arithmetic_page/arithmetic_page.dart';
import '../../../pages/bar_chart_page/view/bar_chart_view.dart';
import '../../../pages/geometric_page/geometric_page.dart';
import '../../../pages/harmonic_page/harmonic_page.dart';
import '../../../pages/median_page/median_page.dart';

class SelectModel {
  final String text;
  final dynamic page;
  SelectModel(this.text, this.page);
}

class SelectModels {
  static final List<SelectModel> selectItems = [
    SelectModel("Aritmetik Ortalama Hesaplama", ArithmeticPage()),
    SelectModel("Geometrik Ortalama Hesaplama", GeometricPage()),
    SelectModel("Harmonik Ortalama Hesaplama", HarmonicPage()),
    SelectModel("Medyan Hesaplama", MedianPage()),
    SelectModel("Mod Hesaplama", ModPage()),
    SelectModel("Varyans Hesaplama", ArithmeticPage()),
    SelectModel("Standart Sapma Hesaplama", ArithmeticPage()),
    SelectModel("Ortalama Sapma Hesaplama", ArithmeticPage()),
    SelectModel("Frekans Serileri İçin A.O Hesaplama", ArithmeticPage()),
    SelectModel("Frekans Serileri için Medyan Hesaplama", ArithmeticPage()),
    SelectModel("Frekans Serileri için Mod Hesaplama", ArithmeticPage()),
    SelectModel("Gruplanmış Seri için A.O Hesaplama", ArithmeticPage()),
    SelectModel("Gruplanmış Seri için Medyan Hesaplama", ArithmeticPage()),
    SelectModel("Gruplanmış Seri için Mod Bulma", ArithmeticPage()),
    SelectModel("Çubuk Grafiği Oluştur", const BarChartPage()),
    SelectModel("Pasta Grafiği Oluştur", BarChartPage()),
  ];
}
