// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../servies/category.api.dart';
import '../model/category_model.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryModel>? _categoryList;
  // bool _isLoading = true;
  getCategory() async {
    if (_categoryList != null) {
      setState(() {
        _categoryList = null;
      });
    }

    _categoryList = await CategoryApi.getCategory();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  // Future<void> getCategory(bool reload) async {
  //   _isLoading = true;
  //   if (reload) {
  //     setState(() {});
  //   }

  //   _categoryList = await CategoryApi.getCategory();
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartItems>(context);

    return _categoryList == null
        ? const Center(
            child: Center(child: CircularProgressIndicator()),
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: _categoryList!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: 100.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                          color: Colors.black38,
                          offset: Offset(5.0, 5.0),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(
                            _categoryList![index].image.toString(),
                            // 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
                            height: 70.0,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _categoryList![index].name.toString(),
                            // 'Ahmed',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
