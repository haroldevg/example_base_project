import 'package:examplebasepj/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

import '../../globals/theme_colors.dart';

class CardPost extends StatelessWidget {

  final PostEntity entity;

  const CardPost({Key? key,required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entity.title,style: TextStyle(
                color: ThemeColors.primaryColorDark,
                fontSize: 16,
                fontWeight: FontWeight.w500
            )),
            SizedBox(height: 10,),
            Text(entity.body,style: const TextStyle(
                fontSize: 13
            )),
          ],
        ),
      ),
    );
  }
}
