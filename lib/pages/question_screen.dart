import 'package:flutter/material.dart';
import 'package:quizz_app/components/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers); //* Gọi hàm onSelectAnswer từ class widget
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; //* Tăng giá trị của currentQuestionIndex lên 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[
        currentQuestionIndex]; //* Lấy câu hỏi đầu tiên từ danh sách câu hỏi

    return SizedBox(
      width: double
          .infinity, //* double.infinity có nghĩa là chiều rộng sẽ bằng với chiều rộng của màn hình
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //! IMPORTANT
            //* Dùng map để tạo ra một danh sách các widget từ một danh sách dữ liệu
            //* Ở đây, chúng ta sẽ tạo ra một danh sách các AnswerButton từ danh sách các câu trả lời
            ...currentQuestion.getShuffledAnswer().map((item) {
              return AnswerButton(
                  answerText: item,
                  onTap: () {
                    answerQuestion(item);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
