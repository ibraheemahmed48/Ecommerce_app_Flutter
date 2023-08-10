import 'package:ecommerce_app/app/screens/User/home_screen.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:flutter/material.dart';
import 'account_screen.dart';
class UserScreen extends StatefulWidget {
  static const String routeName = "/bar-home";
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
   int _page=0;
  double nWidth = 42;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text("Cart Page"),)

  ];

  void _upDatePage(int page){
    setState(() {
      _page = page;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:pages[_page] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Declarations.selectedNavBarColor,
        unselectedItemColor: Declarations.unselectedNavBarColor,
        backgroundColor: Declarations.backgroundColor,
        iconSize: 20,
        items: [
          getNavBottom(
              icon: Icons.home,
              title: 'Home', index: 0,
              ifCart: false
          ),
          getNavBottom(
              icon: Icons.person,
              title: 'Account', index: 1,
              ifCart: false

          ),
          getNavBottom(
              icon: Icons.shopping_cart,
              title: 'Cart', index: 2,
              ifCart: true

          ),

        ],
        onTap: _upDatePage,

      )
    );
  }
  BottomNavigationBarItem getNavBottom({required bool ifCart,required IconData icon, required String title ,required int index}){
    return BottomNavigationBarItem(icon: Badge(
      isLabelVisible: ifCart,
      label: Text("2"),
      child: Container(
        width: nWidth,
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: _page==index?
                  Declarations.selectedNavBarColor:
                  Declarations.backgroundColor,
                  width: 5
              ),

            )
        ),
        child:
        Icon(icon)

      ),
    ),
        label: title
    );

  }
}
