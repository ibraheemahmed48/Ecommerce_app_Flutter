import 'package:flutter/material.dart';
import '../../../components/declarations.dart';
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page=0;
  double nWidth = 42;
  List<Widget> pages = [
    const Center(child: Text("Post page"),),
    const Center(child: Text("Analytics Page"),),

    const Center(child: Text("Items Page"),)

  ];

  void _upDatePage(int page){
    setState(() {
      _page = page;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: Declarations.appBarGradient
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Text("Admin Penal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              )

          ],
        ),
      ),
        body:pages[_page] ,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: Declarations.selectedNavBarColor,
          unselectedItemColor: Declarations.unselectedNavBarColor,
          backgroundColor: Declarations.backgroundColor,
          iconSize: 20,
          items: [
            getNavBottom(
                icon: Icons.post_add,
                title: 'Posts',
              index: 0,
            ),
            getNavBottom(
                icon: Icons.analytics,
                title: 'Analytics',
              index: 1,

            ),
            getNavBottom(
                icon: Icons.all_inbox,
                title: 'Items',
              index: 2,

            ),

          ],
          onTap: _upDatePage

        )

    );
  }
  BottomNavigationBarItem getNavBottom({required IconData icon, required String title ,required int index}){
    return BottomNavigationBarItem(icon: Container(
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
        label: title
    );

  }
}
