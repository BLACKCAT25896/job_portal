import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  final String? icon;
  final Color? color;
  final double? width;
  const MenuImage({super.key, this.icon, this.color, this.width});

  @override
  Widget build(BuildContext context) {
    return

    icon != null?
    SizedBox(height: 16, width: width, child: Image.asset(icon!, color: Theme.of(context).hintColor)): const SizedBox();
  }
}
class SubMenuImage extends StatelessWidget {
  final String? icon;
  const SubMenuImage({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(20,2,0,0), child: CircleAvatar(backgroundColor: Colors.white,radius: 4,));
  }
}