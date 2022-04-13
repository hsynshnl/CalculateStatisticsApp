import 'package:flutter/material.dart';

import '../../search_delegate/search.dart';
import '../models/select_model.dart';
part 'package:istatistik_hesaplama/view/select/select_page/viewmodel/select_view_model.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "İşlem Seç",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search_outlined)),
          )
        ],
        centerTitle: true,
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: _SelectListView()),
    );
  }
}
