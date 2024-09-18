import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/components/layout/page_wrapper.dart';
import 'package:quiz_app/pages/pages.dart';
import 'package:quiz_app/states/quiz_state.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<QuizState>(
      builder: (context, quizState, child) {
        final currentQuestion = quizState.currentQuestion;

WidgetsBinding.instance.addPostFrameCallback((_) {
        if (quizState.isFinished) {
          Navigator.pushNamed(context, PageRoutes.results.path);
        }
});

    return PageWrapper(title: 'Questions', child: SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 241, 241, 241),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  Provider.of<QuizState>(context, listen: false).answerQuestion(answer);
                  Provider.of<QuizState>(context, listen: false).nextQuestion();
                },
              );
            }),
            const SizedBox(height: 30),
            if (quizState.currentQuestionIndex > 0)
              ElevatedButton(
                onPressed: () {
                  Provider.of<QuizState>(context, listen: false).previousQuestion();
                },
                child: const Text('Back'),
              ),
            // Add main menu button
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Main Menu'),
            ),
          ],
        ),
      ),
    ),
    );
      },
    );
  }
}
