import 'package:flutter/material.dart';
import 'package:flutter_recipedia/utils/mock_data.dart';
import 'package:flutter_recipedia/widgets/appbars/post_feed_app_bar.dart';

import '../../widgets/post/post_content.dart';

class PostFeedScreen extends StatefulWidget {
  static const routeName = "/home/feed";

  const PostFeedScreen({Key? key}) : super(key: key);

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PostFeedAppBar(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        cacheExtent: 500,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return PostContent(recipe: mockRecipe);
        },
      ),
    );
  }
}