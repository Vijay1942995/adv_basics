
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final void Function() onTap;
  final String text;
  @override
  Widget build(context) {
     return 
     ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 71, 2, 139),
        foregroundColor: Colors.white,
      ),
       child:  Text(text),
     );
  }
}