import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';

import '../data/questions.dart' as questions_data;

class QuizState with ChangeNotifier {
  final Map<int, String> _answers = {};
  final List<QuizQuestion> _questions = questions_data.questions;

  var _currentQuestionIndex = 0;
  var _isFinished = false;

  Map<int, String> get answers => _answers;

  List<QuizQuestion> get questions => _questions;

  QuizQuestion get currentQuestion => _questions[_currentQuestionIndex];

  int get currentQuestionIndex => _currentQuestionIndex;

  bool get isFinished => _isFinished;

  void answerQuestion(String answer) {
    if (_questions.length <= _currentQuestionIndex) {
      return;
    }

    _answers[_currentQuestionIndex] = answer;

    if (_answers.length >= _questions.length) {
      _isFinished = true;
      notifyListeners();
    }
    notifyListeners();
  }

  void reset() {
    _answers.clear();
    _currentQuestionIndex = 0;
    _isFinished = false;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }
}