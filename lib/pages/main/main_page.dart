import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moti/pages/main/main_controller.dart';

import 'main_view/animated_bottom_navbar.dart';
import 'main_view/get_page.dart';

class MainPage extends StatefulWidget {

const MainPage({Key? key}) : super(key: key);
@override
_MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


@override
Widget build(BuildContext context) {
return GetBuilder<MainController>(
  init: MainController(),
  builder: (controller) {
    return     Scaffold(
    body: getPage(controller.currentPage),
    bottomNavigationBar: AnimatedBottomNav(
    currentIndex: controller.currentPage,
    onChange: (index)=> controller.onPageChanged(index)),
    );
  }
);
}
// getPage(int page) {
// switch (page) {
// case 0:
// return const Center(
// child: Text("Home Page",
// style: TextStyle(fontSize: 16, color: Colors.black)));
// case 1:
// return const Center(
// child: Text("History Page",
// style: TextStyle(fontSize: 16, color: Colors.black)));
// case 2:
// return const Center(
// child: Text("Profile Page",
// style: TextStyle(fontSize: 16, color: Colors.black)));
// }
// }
// }
// class AnimatedBottomNav extends StatelessWidget {
// final int currentIndex;
// final Function(int) onChange;
// const AnimatedBottomNav(
// {Key? key, required this.currentIndex, required this.onChange})
//     : super(key: key);
// @override
// Widget build(BuildContext context) {
// return Container(
// height: kToolbarHeight,
// decoration: const BoxDecoration(color: Colors.white),
// child: Row(
// children: <Widget>[
// Expanded(
// child: InkWell(
// onTap: () => onChange(0),
// child: BottomNavItem(
// icon: Icons.home,
// title: "Home",
// isActive: currentIndex == 0,
// ),
// ),
// ),
// Expanded(
// child: InkWell(
// onTap: () => onChange(1),
// child: BottomNavItem(
// icon: Icons.verified_user,
// title: "History",
// isActive: currentIndex == 1,
// ),
// ),
// ),
// Expanded(
// child: InkWell(
// onTap: () => onChange(2),
// child: BottomNavItem(
// icon: Icons.more_vert,
// title: "Profile",
// isActive: currentIndex == 2,
// ),
// ),
// ),
// ],
// ),
// );
// }
// }
// class BottomNavItem extends StatelessWidget {
// final bool isActive;
// final IconData icon;
// final Color? activeColor;
// final Color? inactiveColor;
// final String title;
// const BottomNavItem(
// {Key? key,
// this.isActive = false,
// required this.icon,
// this.activeColor,
// this.inactiveColor,
// required this.title})
//     : super(key: key);
// @override
// Widget build(BuildContext context) {
// return AnimatedSwitcher(
// transitionBuilder: (child, animation) {
// return SlideTransition(
// position: Tween<Offset>(
// begin: const Offset(0.0, 1.0),
// end: Offset.zero,
// ).animate(animation),
// child: child,
// );
// },
// duration: const Duration(milliseconds: 500),
// reverseDuration: const Duration(milliseconds: 200),
// child: isActive
// ? Container(
// color: Colors.white,
// padding: const EdgeInsets.all(8.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Text(
// title,
// style: TextStyle(
//
// fontWeight: FontWeight.bold,
// color: activeColor ?? Theme.of(context).primaryColor,
// ),
// ),
// const SizedBox(height: 5.0),
// Container(
// width: 5.0,
// height: 5.0,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: activeColor ?? Theme.of(context).primaryColor,
// ),
// ),
// ],
// ),
// )
//     : Icon(
// icon,
// color: inactiveColor ?? Colors.grey,
// ),
// );
// }
}