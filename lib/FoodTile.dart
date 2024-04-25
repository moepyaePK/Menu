import 'package:flutter/material.dart';

import 'food.dart';
import 'shop.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key,
  required this.food,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: onTap,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
         height: 150,
         width: 150,
         decoration: BoxDecoration(
             shape: BoxShape.rectangle,
             color: Colors.white,
             borderRadius: BorderRadius.circular(20),

             border: Border.all(
               color: Color.fromRGBO(248, 119, 74, 0.68), // Specify your desired border color here
               width: 2,
             )

           // Specify your desired border color here

         ),

         child:
         Column(
             children: [

               Text(
                   food.name,
                   style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.normal,
                   )),

               Image.asset(
                 food.imagePath,
                 height: 110 ,),

               Text(
                   food.price+ " Baht",
                   style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.normal,
                   )),




             ]



         ),
       ),
     ),
   );
  }
}
