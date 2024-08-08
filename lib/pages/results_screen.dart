import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i, //* Lấy index của câu hỏi
        'question': questions[i].text, //* Lấy câu hỏi từ danh sách câu hỏi
        'correct_answer': questions[i].answers[0], //* Lấy câu trả lời đúng từ danh sách câu trả lời
        'user_answer': chosenAnswers[i], //* Lấy câu trả lời của người dùng từ danh sách câu trả lời đã chọn
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            const Text('List of answers and questions...'),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('Try again!')),
          ],
        ),
      ),
    );
  }
}
