import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Constant/emojiList.dart';
import 'CategoryCard.dart';

class HorizontalCategoriesView extends StatefulWidget {
  const HorizontalCategoriesView({Key? key}) : super(key: key);

  @override
  State<HorizontalCategoriesView> createState() =>
      _HorizontalCategoriesViewState();
}

class _HorizontalCategoriesViewState extends State<HorizontalCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: EmojiMood.allMood.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: EmojiMood.allMood[index],
            onPressed: (b) {
              EmojiMood.allMood.forEach((category) {
                category.isSelected = false;
              });
              setState(() {
                EmojiMood.allMood[index].isSelected = true;
              });
            },
          );
        },
      ),
    );
  }
}

