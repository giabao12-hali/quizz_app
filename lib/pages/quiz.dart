import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/pages/question_screen.dart';
import 'package:quizz_app/pages/results_screen.dart';
import 'package:quizz_app/pages/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //* Danh sách câu trả lời đã chọn và câu trả lời đúng sẽ được thêm vào list
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  //* Hàm này sẽ được gọi khi người dùng chọn một câu trả lời
  //* Thêm câu trả lời vào danh sách câu trả lời đã chọn mà không thêm vào danh sách
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    //* So sánh độ dài selectedAsnwer đã chọn với độ dài của danh sách questions
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    //* Kiểm tra xem activeScreen có phải là 'question-screen' không
    //* Nếu có, thì sẽ hiển thị QuestionScreen
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    //* Kiểm tra xem activeScreen có phải là 'results-screen' không
    //* Nếu có, thì sẽ hiển thị ResultsScreen
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      ); //* Truyền danh sách selectedAnswers vào ResultsScreen
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: screenWidget,
        ),
      ),
    );
  }
}
