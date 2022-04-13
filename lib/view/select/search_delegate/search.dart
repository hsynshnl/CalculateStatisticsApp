import 'package:flutter/material.dart';

import '../select_page/models/select_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  static List searchItems = SelectModels.selectItems;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return (IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var i = 0; i < searchItems.length; i++) {
      if (searchItems[i].text.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItems[i].text);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return InkWell(
            onTap: () {
              for (var i = 0; i < SelectModels.selectItems.length; i++) {
                if (SelectModels.selectItems[i].text == result) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          SelectModels.selectItems[i].page,
                    ),
                  );
                }
              }
            },
            child: ListTile(
              title: Text(result),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var i = 0; i < searchItems.length; i++) {
      if (searchItems[i].text.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItems[i].text);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return InkWell(
            onTap: () {
              print(result);
              for (var i = 0; i < SelectModels.selectItems.length; i++) {
                if (SelectModels.selectItems[i].text == result) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          SelectModels.selectItems[i].page,
                    ),
                  );
                }
              }
            },
            child: ListTile(
              title: Text(result),
            ),
          );
        });
  }
}
