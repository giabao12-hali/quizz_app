class QuizQuestion {
  // Constructor
  const QuizQuestion(this.text, this.answers);

  //Properties
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffledList = List.of(answers); //* Tạo một biến mới để lấy List cũ và không ảnh hưởng đến List cũ
    shuffledList.shuffle(); //* Gọi hàm shuffle để xáo trộn List mới
    return shuffledList; //* Trả về List đã xáo trộn
  }
}
