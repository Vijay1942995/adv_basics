import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
 const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:  Color.fromARGB(255, 238, 111, 145),
                  ),
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color:const Color.fromARGB(255, 36, 6, 201),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      const SizedBox(height: 5,),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 124, 77, 245),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color:const Color.fromARGB(255, 238, 111, 145),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ],
                  ),
                )
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
