import 'package:flutter/material.dart';

import '../models/numbers_model.dart';

class ValueListBuilder extends StatefulWidget {
  final List<Value> valueList;
  ValueListBuilder({Key? key, required this.valueList}) : super(key: key);

  @override
  State<ValueListBuilder> createState() => _ValueListBuilderState();
}

class _ValueListBuilderState extends State<ValueListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var oAnkiListeElemani = widget.valueList[index];
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
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          key: Key(oAnkiListeElemani.id),
          onDismissed: (direction) {
            widget.valueList.removeAt(index);
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
      itemCount: widget.valueList.length,
    );
  }
}
