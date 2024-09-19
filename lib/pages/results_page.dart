import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/components/layout/page_wrapper.dart';
import 'package:quiz_app/pages/pages.dart';
import 'package:quiz_app/components/questions_summary/questions_summary.dart';
import 'package:quiz_app/states/quiz_state.dart';

/// A page that displays the results of the quiz
class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizState>(
      builder: (context, quizState, child) {

        /// Returns a list of maps containing the summary data
        List<Map<String, dynamic>> getSummaryData() {
    final List<Map<String, dynamic>> summary = [];

    final questions = quizState.questions;
    final chosenAnswers = quizState.answers;

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i] ?? '',
      });
    }

    return summary;
  }

  final summaryData = getSummaryData();
    final numTotalQuestions = quizState.questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return PageWrapper(title: 'Results', child: SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 40),
            TextButton.icon(
              onPressed: () {
                Provider.of<QuizState>(context, listen: false).reset();
                Navigator.popUntil(context, ModalRoute.withName(PageRoutes.home.path));
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Main menu!'),
            ),
          ],
        ),
      ),
    ));
      }
    );
  }
}