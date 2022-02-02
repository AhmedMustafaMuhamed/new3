import 'package:flutter/material.dart';
import 'package:new3/model/product_model.dart';
import 'package:new3/servies/product.api.dart';

class ServicesProvider extends ChangeNotifier {
 
  List<ProductModel>? productList;
 
 
 
  List<ProductModel>? getProductList() => productList;
 
 
 
  getData() async {
    if (productList != null) {
      productList = null;
      notifyListeners();
    }

    productList = await ProductApi.getProduct();
    notifyListeners();
  }
}
