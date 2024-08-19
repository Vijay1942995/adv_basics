

import 'package:adv_basics/firstview_widget.dart';
import 'package:flutter/material.dart';

class ElevatedButtonExmpl extends StatefulWidget {
  const ElevatedButtonExmpl({super.key});
  @override
  State<ElevatedButtonExmpl> createState () {
    return _ElevatedButtonExmplState();
  }
}

class _ElevatedButtonExmplState extends State<ElevatedButtonExmpl> {
      
   bool isLoggedIn = false;
   String text = 'Login';
   void buttonPress(){

         setState(() {
          isLoggedIn = !isLoggedIn;
          text = isLoggedIn ? 'Login' : 'Log Out';

   });

   }
      @override
      Widget build(context) {
        return Container(
          padding:const EdgeInsets.only(top: 20.0),
          child: ElevatedButton.icon(
                  onPressed: buttonPress, 
                  icon: const Icon(
                    Icons.login,
                    color: Color.fromARGB(255, 219, 161, 73),
                    ),
                  label:  CustomText(customText: text),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  ),
        );
      }
}