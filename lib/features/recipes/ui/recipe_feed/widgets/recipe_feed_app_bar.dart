import 'package:flutter/material.dart';

class RecipeFeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController controller;

  const RecipeFeedAppBar({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () {
          controller.animateTo(
            controller.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Text(
          "recipedia",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}