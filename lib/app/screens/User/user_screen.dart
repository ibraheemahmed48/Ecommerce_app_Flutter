import 'package:ecommerce_app/app/screens/User/home_screen.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';
import 'account_screen.dart';
import 'cart_screen.dart';
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
    const CartScreen()

  ];

  void _upDatePage(int page){
    setState(() {
      _page = page;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<UserProvider>().user.cart.length;
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
              ifCart: cartCount==0?false:true,
            cartCount: cartCount
          ),

        ],
        onTap: _upDatePage,

      )
    );
  }
  BottomNavigationBarItem getNavBottom({required bool ifCart,required IconData icon, required String title ,
    required int index,int cartCount= 0}){
    return BottomNavigationBarItem(icon: Badge(
      isLabelVisible: ifCart,
      label: Text(cartCount.toString()),
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
