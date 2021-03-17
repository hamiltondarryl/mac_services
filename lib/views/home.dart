import 'package:flutter/material.dart';
import 'package:mac_services/views/pageViews/cart.dart';
import 'package:mac_services/views/pageViews/homepage.dart';
import 'package:mac_services/views/pageViews/profil.dart';

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
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: _selectedIndex == 0 ? 40 :25.0,),
            title: Text('Accueil')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: _selectedIndex == 1 ? 40 :25.0,),
            title: Text('Panier')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: _selectedIndex == 2 ? 40 :25.0),
            title: Text('Profil')
          )
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
