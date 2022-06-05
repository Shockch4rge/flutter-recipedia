import 'package:flutter/material.dart';
import 'package:flutter_recipedia/models/recipe.dart';

class ViewRecipeAppBar extends StatelessWidget {
  final double maxHeight;
  final double minHeight;
  final Recipe recipe;

  const ViewRecipeAppBar(
      {Key? key,
      required this.recipe,
      required this.maxHeight,
      required this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.arrow_back),
        tooltip: "Back",
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: ViewRecipeAppBarSpacer(
        recipe: recipe,
        maxHeight: maxHeight,
        minHeight: minHeight,
      ),
      expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
    );
  }
}

class ViewRecipeAppBarSpacer extends StatelessWidget {
  final double maxHeight;
  final double minHeight;
  final Recipe recipe;

  const ViewRecipeAppBarSpacer(
      {Key? key,
      required this.recipe,
      required this.maxHeight,
      required this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(),
            _buildGradient(animation),
            _buildTitle(animation),
          ],
        );
      },
    );
  }

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  Align _buildTitle(Animation<double> animation) {
    return Align(
      alignment: AlignmentTween(
              begin: Alignment.bottomCenter, end: Alignment.bottomLeft)
          .evaluate(animation),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(bottom: 12, left: 12),
        child: Text(
          recipe.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            fontSize: Tween<double>(
              begin: 18,
              end: 28,
            ).evaluate(animation),
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Container _buildGradient(Animation<double> animation) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ColorTween(
              begin: Colors.black87,
              end: Colors.black45,
            ).evaluate(animation)!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Image _buildImage() {
    return Image.asset(
      recipe.imageUrl,
      fit: BoxFit.cover,
    );
  }
}
