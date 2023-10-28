import 'package:flutter/material.dart';
import 'package:flutter_engineer_ui_translation_test/presentation/screens/home.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  List<Widget> pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  var currentIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: pages[currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          iconSize: 18,
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          unselectedItemColor: const Color(0xff292D32),
          selectedItemColor: Colors.teal,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Iconsax.home5),
            ),
            BottomNavigationBarItem(
              label: 'Voucher',
              icon: Icon(Iconsax.pen_add),
            ),
            BottomNavigationBarItem(
              label: 'Wallet',
              icon: Icon(Iconsax.wallet),
            ),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Iconsax.setting)
            ),
          ],
        ),
      ),
    );
  }
}
