
import 'package:flutter/material.dart';
import 'package:news/Models/categories_model.dart';
import 'package:news/screens/CategoryScreen/Category_item.dart';

class Categories extends StatelessWidget {
  static const String routeName='CategoriesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff39A552),
        title: Text('News'),
        centerTitle: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(itemCount: CategoryModel.categories.length,itemBuilder: (context, index) {
          return CategoryItem(CategoryModel.categories[index], index);
        },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
      ),
    );
  }
}
