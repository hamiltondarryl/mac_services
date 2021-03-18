import 'package:flutter/material.dart';
import 'package:mac_services/views/pageViews/cart.dart';
import 'package:mac_services/views/pageViews/homepage.dart';
import 'package:mac_services/views/pageViews/profil.dart';
import 'package:mac_services/views/pageViews/search.dart';
import 'package:mac_services/widgets/bottombavigationbarItem.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   int _selectedIndex = 0;
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (pageIndex) {
          setState(() {
            _selectedIndex = pageIndex;
          });
        },
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          Search(),
          Cart(),
          Profile(),
        ],
      ),
       //La bottombar de navigatiuon
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTappedBar,
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        elevation: 50.0,
        items: [
           customBottomNavigationBarItem(title: "Accueil", icon: Icons.home, curentIndex: _selectedIndex, index: 0 ),
           customBottomNavigationBarItem(title: "Recherche", icon: Icons.search, curentIndex: _selectedIndex, index: 1 ),
           customBottomNavigationBarItem(title: "Panier", icon: Icons.shopping_cart_outlined, curentIndex: _selectedIndex, index: 2 ),
           customBottomNavigationBarItem(title: "Profil", icon: Icons.person_outline, curentIndex: _selectedIndex, index: 3 ),
        ]
      ),
    );
  
  }

   //fonction de navigation 
  void _onTappedBar(int value) {

    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
    }

  }
