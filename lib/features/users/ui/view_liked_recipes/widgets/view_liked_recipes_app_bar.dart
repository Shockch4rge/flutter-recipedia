import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewLikedRecipesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ViewLikedRecipesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        tooltip: "Back",
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Liked Recipes",
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
