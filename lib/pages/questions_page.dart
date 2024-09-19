import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/components/layout/page_wrapper.dart';
import 'package:quiz_app/pages/pages.dart';
import 'package:quiz_app/states/quiz_state.dart';


/// A page that displays the questions and answers for the quiz
class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<QuizState>(
      builder: (context, quizState, child) {
        final currentQuestion = quizState.currentQuestion;

        // Runs after the page has loaded
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (quizState.isFinished) {
            Navigator.pushNamed(context, PageRoutes.results.path);
          }
        });

    return PageWrapper(title: 'Questions', child: Stack(
            children: [
              Center(
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
                Provider.of<QuizState>(context, listen: false).reset();
                Navigator.popUntil(context, ModalRoute.withName(PageRoutes.home.path));
              },
              child: const Text('Main Menu'),
            ),
            ],
          ),
        ),
      ),
                Positioned(
                  top: 72,
                  right: 32,
                  child: Text(
                    '${quizState.currentQuestionIndex + 1} / ${quizState.questions.length}',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        );
        },
      );
    }
  }
