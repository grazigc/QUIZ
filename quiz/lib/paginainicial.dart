import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

void main() {
  runApp(const InicialPage());
}

class InicialPage extends StatelessWidget {
  const InicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFB1B7E9),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'QUIZ',
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color(0xFFE3A8D7),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/imagens/globe-24.gif'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Quiz()));
                },
                child: Container(
                  height: 53,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF91DF9E), Color(0xFFD1E2A1)],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'COMEÇAR',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
