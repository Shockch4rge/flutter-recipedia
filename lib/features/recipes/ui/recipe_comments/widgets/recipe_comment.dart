import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_recipedia/common/avatar.dart';
import 'package:flutter_recipedia/models/recipe.dart' as model;
import 'package:flutter_recipedia/repositories/user_repository.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../../../models/user.dart';

class RecipeComment extends StatelessWidget {
  final model.RecipeComment comment;
  final void Function(User user) onReply;

  const RecipeComment({Key? key, required this.onReply, required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<UserRepository>().getUserById(comment.userId),
      builder: (context, snap) {
        final user = snap.data! as User;

        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            closeThreshold: 0.1,
            extentRatio: 0.3,
            children: [
              SlidableAction(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                onPressed: (_) => onReply(user),
                icon: CupertinoIcons.arrow_turn_up_left,
              ),
              SlidableAction(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                onPressed: (_) {
                  // TODO: delete comment
                  print("Delete tapped");
                },
                icon: CupertinoIcons.delete_simple,
              )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Avatar(
                    size: 40,
                    avatarUrl: user.avatarUrl,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "johndoe123",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "I love this recipe! Highly recommend it. Will make it again sometime!",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "1.2k likes",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () => onReply(user),
                            child: const Text(
                              "Reply",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    splashRadius: 18,
                    icon: const Icon(
                      FeatherIcons.heart,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
