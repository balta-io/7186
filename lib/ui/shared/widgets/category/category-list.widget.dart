import 'package:shopping/models/category-list-item.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/ui/shared/widgets/shared/loader.widget.dart';
import 'category-card.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  CategoryList({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryListItemModel item = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCard(
            item: item,
          ),
        );
      },
    );
  }
}
