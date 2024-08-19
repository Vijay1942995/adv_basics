import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/firstview_widget.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.colorList, required this.choosenAnswer, required this.restartQuiz});
  final List<Color> colorList;
  final List<String> choosenAnswer;
  final void Function() restartQuiz; 
  
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for(var i = 0; i < choosenAnswer.length; i++) {
        
        summaryData.add(
          {
            'question_index': i,
             'question': questions[i].question,
             'correct_answer': questions[i].answer[0],
             'user_answer': choosenAnswer[i]
          }
        );
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    final numOfTotalQuestion = questions.length;
    final numOfCorrectAnswer = getSummaryData().where((data){
     return data['user_answer'] == data['correct_answer'];
    }).length;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:colorList,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
           )
      ),
      child:  SizedBox(
       width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text(
                'From $numOfTotalQuestion questions you answered $numOfCorrectAnswer question',
                style: GoogleFonts.lato(
                          color:const Color.fromARGB(255, 36, 6, 201),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                ),
              const SizedBox(height: 30,),
              QuestionSummary(summaryData: getSummaryData()),
              // TextButton(
              //   onPressed: restartQuiz,
              //    child: const Text('Restart Quiz')
              //    ),
                 OutLinedButton('Restart Quiz', restartQuiz),

            ],
          ),
        ),
      ),
    );
  }
}
