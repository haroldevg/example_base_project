import 'package:examplebasepj/domain/entities/entities.dart';
import 'package:examplebasepj/globals/theme_colors.dart';
import 'package:examplebasepj/presentation/widgets/button_publication.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {

  final UserEntity entity;
  final VoidCallback? onTap;
  final bool showButton;

  const CardUser({Key? key,required this.entity,this.onTap,this.showButton = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entity.name,style: TextStyle(
              color: ThemeColors.primaryColorDark,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone,color: ThemeColors.primaryColor,size: 18),
                const SizedBox(width: 5,),
                Text(entity.phone,style: const TextStyle(
                  fontSize: 13
                ))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.email,color: ThemeColors.primaryColor,size: 18),
                const SizedBox(width: 5,),
                Text(entity.email,style: const TextStyle(
                    fontSize: 13
                ))
              ],
            ),
           showButton ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonPublication(
                  onTap: () {
                    if(onTap != null){
                      onTap!();
                    }
                  },
                )
              ],
            ) : SizedBox()
          ],
        ),
      ),
    );
  }
}
