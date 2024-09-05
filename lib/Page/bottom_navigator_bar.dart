
import 'package:book_store/Page/Cart_page.dart';
import 'package:book_store/Page/Home_Page.dart';
import 'package:book_store/Page/profile_page.dart';
import 'package:book_store/splash.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});
  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();}
class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    HomePage(),
    ProfilePage(),
    CartPage(),
    SplashScreen(),
  ];
  List<Icon> allItems = [
    Icon(Icons.home,color: Colors.white,),
    Icon(Icons.person,color: Colors.white,),
    //Icon(Icons.medication_liquid_outlined,color: Colors.white,),
    Icon(Icons.shopping_cart_outlined,color: Colors.white,)
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color:Color(0xff240046) ,

        buttonBackgroundColor:Color(0xff240046),
        index: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {
          });
        },
        items: allItems,
      ),
    );  }
}

