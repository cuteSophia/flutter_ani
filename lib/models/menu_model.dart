import 'package:flutter/material.dart';

class MenuModel {
  final IconData icon;
  final String title;

  MenuModel({required this.icon, required this.title});
}

List<MenuModel> sideMenus = [
  MenuModel(icon: Icons.home_outlined, title: 'Home'),
  MenuModel(icon: Icons.search_outlined, title: 'Search'),
  MenuModel(icon: Icons.star_outline, title: 'Favorites'),
  MenuModel(icon: Icons.chat_outlined, title: 'Help'),
];

List<MenuModel> sideMenus2 = [
  MenuModel(icon: Icons.history, title: 'History'),
  MenuModel(icon: Icons.notifications_outlined, title: 'Notification'),
];
