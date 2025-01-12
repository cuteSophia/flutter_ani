import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final bool isClosed;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.isClosed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Center(
            child: AnimatedCrossFade(
              firstChild: const Icon(Icons.menu),
              secondChild: const Icon(Icons.close),
              crossFadeState: isClosed
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 100),
              alignment: Alignment.center,
            ),
            // AnimatedIcon(
            //   icon: AnimatedIcons.menu_close,
            //   progress: isClosed
            //       ? const AlwaysStoppedAnimation(1)
            //       : const AlwaysStoppedAnimation(0),
            //   color: Colors.black,
            // ),
          ),
        ),
      ),
    );
  }
}
