import 'package:new3/model/product_model.dart';
import 'package:new3/servies/product.api.dart';
import 'package:flutter/material.dart';
import 'package:new3/view/categories.dart';
import 'package:new3/view/home.dart';
import 'package:new3/view/login.dart';

class ViewProvider extends ChangeNotifier {
  var index = 0;
  List<Widget> screens = [Home(), Categories(), LogIn()];
  List<ProductModel>? productList;
  List<ProductModel>? getProductlist() => productList;

  getData() async {
    if (productList != null) {
      // setState(() {
      notifyListeners();
      productList = null;
      notifyListeners();
      // });
    }

    productList = await ProductApi.getProduct();
    notifyListeners();
    //setState(() {});
  }

  void changeIndex(int newindex) {
    index = newindex;
    notifyListeners();
  }
}
