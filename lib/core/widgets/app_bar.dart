import 'package:flutter/material.dart';

import 'help_alert_dialog.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String description;
  final String imagePath;
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.description,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return HelpAlertDialog(
                      imagePath: imagePath, description: description);
                },
              );
            },
            icon: const Icon(Icons.help_outline))
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
