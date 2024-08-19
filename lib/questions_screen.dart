

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
 const QuestionsScreen(this.colorList, {super.key, required this.onSelectAnswer});
  final List<Color>? colorList;
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    // ignore: no_logic_in_create_state
    return _QuestionsScreenState(colorList);
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
   _QuestionsScreenState(this.colorList);
   var currentQuestionIndex = 0;
  final List<Color>? colorList;
  
  void questionAnswer(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
    //  if (currentQuestionIndex < questions.length-1) {
       currentQuestionIndex++;
    //  }
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList?? [Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin:const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Text(
                currentQuestion.question,
                style:GoogleFonts.lato(
                  color:const Color.fromARGB(255, 63, 75, 232),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                  ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ...currentQuestion.getShuffledAnswer().map((answer) {
                return AnswerButton(text: answer, onTap: (){
                   questionAnswer(answer);
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
