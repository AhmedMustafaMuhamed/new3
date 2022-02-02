import 'package:flutter/material.dart';
import 'package:new3/providers/view_Provider.dart';
import 'package:new3/view/home.dart';
import 'package:new3/view/login.dart';
import 'package:provider/provider.dart';

import 'categories.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: ViewProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  init(BuildContext context)
 var index = Provider.of<ViewProvider>(context, listen: false).index;
    var screens = Provider.of<ViewProvider>(context, listen: false).screens;
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int NewIndex) {
            // setState(() {
            // index = NewIndex;
            // });
            Provider.of<ViewProvider>(context, listen: false)
                .changeIndex(NewIndex);
          },
          currentIndex: Provider.of<ViewProvider>(context, listen: false).index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'CATEGORIES'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
          ],
        ),
      ),
    );
  }
}
