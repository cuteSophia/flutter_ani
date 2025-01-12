import 'package:flutter/material.dart';
import 'package:flutter_ani/models/menu_model.dart';

class SideMenuTile extends StatelessWidget {
  final MenuModel menu;
  final bool isActive;
  final VoidCallback onTap;

  const SideMenuTile({
    super.key,
    required this.menu,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white12,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              height: 48,
              width: isActive ? 288 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff6792ff),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: onTap,
              leading: Icon(
                menu.icon,
                color: Colors.white,
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
