import 'package:flutter/material.dart';
import 'package:news/Models/categories_model.dart';
import 'package:news/screens/CategoryScreen/homeLayout.dart';
import 'package:news/screens/NewsScreen/NewsScreen.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem(this.categoryModel, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, newsScreen.routeName,
            arguments: CategoryModel.categories[index]);
      },
      child: Container(
        margin: EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(color: categoryModel.color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomRight: index.isOdd ? Radius.circular(25) : Radius.zero,
                bottomLeft: index.isEven ? Radius.circular(25) : Radius.zero
            )),
        child: Column(children: [
          Expanded(
            child: Image(
              image: AssetImage(categoryModel.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              categoryModel.Name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
          )
        ]),
      ),
    );
  }
}
