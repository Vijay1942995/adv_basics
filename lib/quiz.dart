


import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/firstview_widget.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget{
 const Quiz({super.key});
 @override
 State<Quiz> createState () {
             return _QuizState();
 }
}

class _QuizState extends State<Quiz> {
  
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];

  void chooseAnswer(String answer){
          selectedAnswer.add(answer);
          setState(() {
            if(selectedAnswer.length == questions.length){
              activeScreen = 'results-screen';
            }
          });
          debugPrint('added answer $selectedAnswer');
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }
   
  @override
  Widget build(BuildContext context) {
  const List<Color> colorList = [
           Color.fromARGB(255, 40, 24, 224),
           Color.fromARGB(31, 43, 29, 208),
           Color.fromARGB(66, 40, 43, 213),
          ];
  Widget currentWidget =   FirstviewWidget(switchScreen ,colorList: colorList);
  
  if (activeScreen == 'question-screen') {
      currentWidget =  QuestionsScreen(colorList, onSelectAnswer: chooseAnswer);
  } 
  if (activeScreen == 'results-screen') {
      currentWidget =  ResultsScreen(colorList: colorList, choosenAnswer: selectedAnswer, restartQuiz: restartQuiz,);
  }

   return MaterialApp(
      home: Scaffold(
        body: currentWidget,
      ),
    );
  }

}