// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  Widget icon;
  VoidCallback onPressed;
  NavigationButton({super.key, required this.icon, required this.onPressed});

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: CircleBorder(),
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      child: widget.icon,
    );
  }
}
