import 'package:examplebasepj/globals/theme_colors.dart';
import 'package:flutter/material.dart';

class ButtonPublication extends StatefulWidget {

  final VoidCallback onTap;

  const ButtonPublication({Key? key,required this.onTap}) : super(key: key);

  @override
  State<ButtonPublication> createState() => _ButtonPublicationState();
}

class _ButtonPublicationState extends State<ButtonPublication> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: Text('VER PUBLICACIONES',style: TextStyle(
            color: ThemeColors.primaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w500
        ),),
      ),
      onTap: () {
        widget.onTap();
      },
    );
  }
}
