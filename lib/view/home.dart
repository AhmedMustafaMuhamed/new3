import 'package:flutter/material.dart';
import 'package:new3/model/product_model.dart';
import 'package:provider/provider.dart';
import '../servies/product.api.dart';
import 'package:new3/providers/view_Provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  void getData(BuildContext context) {
    Provider.of<ViewProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    var productList =
        Provider.of<ViewProvider>(context, listen: false).productList;
    return productList == null
        ? const Center(
            child: Center(child: CircularProgressIndicator()),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('BUYITNOW'),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.login_rounded),
                        label: Text('LOGIN'),
                      )
                    ],
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  itemCount: productList.length,
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
                                  productList[index].avatar.toString(),
                                  // 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
                                  height: 70.0,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  productList[index].name.toString(),
                                  // 'Ahmed',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  productList[index].description.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  // 'mohamed',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 2.0,
                                  right: 2.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '₹',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text(
                                          productList[index].price.toString(),
                                          // '1000',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    new GestureDetector(
                                      child: IconButton(
                                        splashColor: Colors.blue,
                                        tooltip: 'Add to cart',
                                        onPressed: () {
                                          final ScaffoldMessengerState
                                              addToCartMsg =
                                              ScaffoldMessenger.of(context);
                                          addToCartMsg.showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Product added sucessfully')),
                                          );
                                          // cart.addItem(
                                          //     listResponse[index]['Id'].toString(),
                                          //     listResponse[index]['Name'],
                                          //     listResponse[index]['Price']);
                                        },
                                        icon: Icon(
                                            Icons.add_shopping_cart_rounded),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            scrollDirection: Axis.vertical,
          );
  }
}
