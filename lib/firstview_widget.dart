import 'package:adv_basics/elevated_button_exmpl.dart';
import 'package:flutter/material.dart';

class FirstviewWidget extends StatelessWidget {
  const FirstviewWidget(this.startQuiz ,{super.key, required this.colorList});
   final void Function() startQuiz;
  final List<Color> colorList;
  final Alignment startAlignment = Alignment.topLeft;
  final Alignment endAlignment = Alignment.bottomRight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: startAlignment,
          end: endAlignment,
          ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
              ),
            const CustomText(customText: 'Learn flutter the fun way'),
             OutLinedButton('Start Quiz',startQuiz),
            const ElevatedButtonExmpl(),
          ],
        ),
      ),
    );
  }
}

class OutLinedButton extends StatelessWidget {
  const OutLinedButton(this.text,this.startQuiz, {super.key});
  final void Function() startQuiz;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: OutlinedButton.icon(
        onPressed: () {
          debugPrint(text);
          startQuiz();
        },
        icon: const Icon(Icons.arrow_right_alt),
        label: CustomText(customText: text),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.customText});
  final String customText;
  @override
  Widget build(context) {
    return Container(
      transform: Matrix4.rotationZ(0.05),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 97, 230, 210),
      ),
      padding:const EdgeInsets.only(top: 20),
      child: Text(
        customText,
        style: const TextStyle(
          fontSize: 20.0, 
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 237, 49, 196),
          ),
      ),
    );
  }
}
