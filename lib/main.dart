import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/pages.dart';
import 'package:quiz_app/pages/questions_page.dart';
import 'package:quiz_app/pages/results_page.dart';
import 'package:quiz_app/states/quiz_state.dart';

/// Entry point of the application
/// Runs the app and creates providers to manage the state
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizState()),
      ],
      child: const MyApp(),
    ),
  );
}

/// The main application widget
/// Contains the routes for the different pages
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      
      initialRoute: PageRoutes.home.path,
      routes: {
        PageRoutes.home.path: (context) => HomePage(),
        PageRoutes.questions.path: (context) => const QuestionsPage(),
        PageRoutes.results.path: (context) => const ResultsPage(),
      },
    );
  }
}