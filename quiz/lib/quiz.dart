import 'package:flutter/material.dart';
import 'package:quiz/resultado.dart';

void main() {
  runApp(MaterialApp(
    home: Quiz(),
  ));
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question> questions = [
    Question(
      'QUE PAÍS É ESSE?',
      'ALEMANHA',
      'assets/imagens/Germany.png',
      ['BRASIL', 'ARGENTINA', 'FRANÇA', 'ALEMANHA'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'FRANÇA',
      'assets/imagens/france.png',
      ['HOLANDA', 'RÚSSIA', 'FRANÇA', 'PARAGUAI'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'COREIA DO NORTE',
      'assets/imagens/coreiaNorte.png',
      ['COREIA DO NORTE', 'FILIPINAS', 'GUIANA FRANCESA', 'CUBA'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'CUBA',
      'assets/imagens/Cuba.png',
      ['PERU', 'PARAGUAI', 'CUBA', 'URUGUAI'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'ISRAEL',
      'assets/imagens/Israel.png',
      ['COREIA DO NORTE', 'PALESTINA', 'ISRAEL', 'PAQUISTÃO'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'JAMAICA',
      'assets/imagens/Jamaica.png',
      ['REPÚBLICA DOMINICANA', 'JAMAICA', 'BOLIVIA', 'GUATEMALA'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'PAQUISTÃO',
      'assets/imagens/Paquistão.png',
      ['PAQUISTÃO', 'EQUADOR', 'ARÁBIA SAUDITA', 'CUBA'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'RÚSSIA',
      'assets/imagens/Russia.png',
      ['ITÁLIA', 'FRANÇA', 'PAÍSES BAIXOS', 'RÚSSIA'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'ESPANHA',
      'assets/imagens/Spain.png',
      ['VENEZUELA', 'EQUADOR', 'ESPANHA', 'BOLÍVIA'],
    ),
    Question(
      'QUE PAÍS É ESSE?',
      'VENEZUELA',
      'assets/imagens/Venezuela.png',
      ['ESPANHA', 'VENEZUELA', 'PERU', 'BOLÍVIA'],
    ),
  ];

  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool answerGiven = false;

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answerGiven = false;
      });
    } else {
      // Fim do quiz
      print('Número de respostas corretas: $correctAnswers');
      print(
          'Número de respostas erradas: ${questions.length - correctAnswers}');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoScreen(
            correctAnswers: correctAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB1B7E9),
      appBar: AppBar(
        title: const Text(
          'QUIZ',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFE3A8D7),
        centerTitle: true,
      ),
      body: Column(
        children: [
          QuestionWidget(
            question: questions[currentQuestionIndex],
            onAnswer: (isCorrect) {
              if (isCorrect) {
                correctAnswers++;
              }
              setState(() {
                answerGiven = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                nextQuestion();
              });
            },
            currentQuestionIndex: currentQuestionIndex,
            totalQuestions: questions.length,
          ),
        ],
      ),
    );
  }
}

class Question {
  final String questionText;
  final String correctAnswer;
  final String imageAsset;
  final List<String> options;

  Question(
      this.questionText, this.correctAnswer, this.imageAsset, this.options);
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(bool) onAnswer;
  final int currentQuestionIndex;
  final int totalQuestions;

  QuestionWidget({
    required this.question,
    required this.onAnswer,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pergunta ${currentQuestionIndex + 1} de $totalQuestions',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Image.asset(
              question.imageAsset,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              question.questionText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            for (var option in question.options)
              ElevatedButton(
                onPressed: () {
                  onAnswer(option == question.correctAnswer);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
