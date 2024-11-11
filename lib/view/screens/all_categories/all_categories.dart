import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/utils/all_categories_list.dart';
import 'package:e_learning_app/view/widget/category_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Category',
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          mainAxisExtent: 100,
        ),
        shrinkWrap: true,
        padding: AppSizes.VERTICAL,
        physics: BouncingScrollPhysics(),
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          return CategoryWidget(
            icon: allCategories[index]['icon'],
            title: allCategories[index]['title'],
            onTap: () {},
          );
        },
      ),
    );
  }
}
