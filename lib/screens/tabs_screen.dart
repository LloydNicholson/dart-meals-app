import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'title': 'Categories', 'page': CategoriesScreen()},
    {'title': 'Favourites', 'page': FavouritesScreen()},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedFontSize: 16,
          selectedFontSize: 20,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text('Categories'),
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text('Favourites'),
              icon: Icon(Icons.star),
            ),
          ],
        ),
      ),
    );
    //    return Platform.isIOS
//        ? CupertinoTabScaffold(
//            tabBar: CupertinoTabBar(
//              items: [
//                BottomNavigationBarItem(
//                  icon: Icon(Icons.category),
//                  title: Text('Categories'),
//                ),
//                BottomNavigationBarItem(
//                  icon: Icon(Icons.star),
//                  title: Text('Favourites'),
//                ),
//              ],
//            ),
//            tabBuilder: (ctx, index) {
//              return CupertinoPageScaffold(
//                navigationBar: CupertinoNavigationBar(
//                  middle: Text('Categories'),
//                ),
//                child: Center(
//                  child: index == 0 ? Text('Categories Screen') : FavouritesScreen(),
//                ),
//              );
//            },
//          ) :
//    return DefaultTabController(
//      initialIndex: 0,
//      length: 2,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text('Meals'),
//          bottom: TabBar(
//            tabs: <Widget>[
//              Tab(
//                icon: Icon(Icons.category),
//                text: 'Categories',
//              ),
//              Tab(
//                icon: Icon(Icons.star),
//                text: 'Favourites',
//              ),
//            ],
//          ),
//        ),
//        body: TabBarView(
//          children: <Widget>[
//            CategoriesScreen(),
//            FavouritesScreen(),
//          ],
//        ),
//      ),
//    );
  }
}
