import 'package:examplebasepj/globals/theme_colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final TextEditingController controller;
  final String hint;

  const SearchBar({Key? key,required this.hint,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(
            color: ThemeColors.primaryColor
          ),
          alignLabelWithHint: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.primaryColor
            )
          )
        ),
      ),
    );
  }
}
