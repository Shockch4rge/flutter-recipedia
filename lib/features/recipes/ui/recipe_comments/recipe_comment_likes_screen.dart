import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipedia/features/recipes/ui/recipe_comments/widgets/recipe_comment_likes.dart';
import 'package:flutter_recipedia/features/recipes/ui/recipe_comments/widgets/recipe_like_list_item.dart';
import 'package:flutter_recipedia/models/user.dart';
import 'package:flutter_recipedia/repositories/user_repository.dart';
import 'package:flutter_recipedia/utils/extensions/async_helper.dart';
import 'package:flutter_recipedia/utils/get_args.dart';
import 'package:provider/provider.dart';

class RecipeCommentLikesScreen extends StatefulWidget {
  static const routeName = "/home/recipe/likes";

  const RecipeCommentLikesScreen({Key? key}) : super(key: key);

  @override
  State<RecipeCommentLikesScreen> createState() =>
      _RecipeCommentLikesScreenState();
}

class _RecipeCommentLikesScreenState extends State<RecipeCommentLikesScreen> {
  final _scrollController = ScrollController();
  late final likes = getArgs<List<DocumentReference>>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeCommentLikesAppBar(
        onTitleTapped: () => _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      ),
      body: FutureBuilder(
        future: context.read<UserRepository>().getUsers(likes),
        builder: (context, snap) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (snap.waiting) {
                return Container();
              }

              final likers = snap.data as List<User>;
              return RecipeLikeListItem(liker: likers[index]);
            },
          );
        },
      ),
    );
  }
}
