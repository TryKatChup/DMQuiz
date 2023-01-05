import 'package:flutter/services.dart';
import 'package:dmquiz/model/Question.dart';
import 'package:dmquiz/model/Answer.dart';
import 'dart:io';
import 'dart:convert';

import 'package:dmquiz/model/Settings.dart';

class QuestionRepository {
  List<Question> _questions = [];
  List<String> _topics = [];
  List<int> _qNumPerTopic = [];
  bool _topicsPresent = false;

  Future<void> loadFile(String filePath) async {
    int numPerTopic = 0, totQuest = 0;
    String fileText = await rootBundle.loadString(filePath);

    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(fileText);

    // the question file can be subdivided by topics (i == line #)
    for (int i = 0; i < lines.length; i++) {
      // if the first line starts with '@', then the file has topics
      if (i == 0 && lines[i].startsWith("@")) {
        _topicsPresent = true;

        _topics.add(lines[i].substring(1).replaceAll("=", ""));

        continue;
      }

      // next question
      if (lines[i].isNotEmpty) {
        // next topic
        if (_topicsPresent && lines[i].startsWith("@")) {
          _qNumPerTopic.add(numPerTopic);
          numPerTopic = 0;

          _topics.add(lines[i].substring(1).replaceAll("=", ""));
          i++;
        } else if (lines[i].startsWith("@")) {
          throw FileSystemException(
              "Riga ${i + 1}: divisione per argomenti non rilevata (non è presente l'argomento per le prime domande), ma ne è stato trovato uno comunque");
        }

        // multiline question
        String qString = lines[i];
        if (lines[i].endsWith("\\n")) {
          while (lines[i].endsWith("\\n")) {
            i++;
            qString += lines[i];
          }
        }
        Question q = Question(qString);

        i++;
        // answers
        int k = 0;
        while (lines[i].length > 1) {
          List<String> splitted = lines[i].split(". ");
          if (splitted.length < 2 || splitted[1].isEmpty) {
            throw FileSystemException(
                "Riga ${i + 1}: risposta ${String.fromCharCode((k + 65))} formata male");
          }
          q.addAnswer(splitted[1]);

          k++;
          i++;
        }

        if (lines[i].isEmpty) {
          throw FileSystemException("Riga ${i + 1}: risposta corretta assente");
        }
        if (lines[i].length != 1 ||
            !_isCorrectAnswerValid(k, lines[i].codeUnitAt(0))) {
          throw FileSystemException(
              "Riga ${i + 1}: risposta corretta non valida (numero risposte: $k, risposta corretta indicata: ${lines[i]}.");
        }

        _questions.add(q);
        q.setCorrectAnswerFromInt(lines[i].codeUnitAt(0) - 65);
        totQuest++;

        if (_topicsPresent) numPerTopic++;
      }
    }

    if (_topicsPresent) {
      _qNumPerTopic.add(numPerTopic);

      // test
      print("Tot domande: $totQuest");
      print("Argomenti: ");
      for (int i = 0; i < _qNumPerTopic.length; i++) {
        print("- ${_topics[i]} (num domande: ${_qNumPerTopic[i].toString()})");
      }
    }
  }

  bool _isCorrectAnswerValid(int answers, int correct) {
    return (correct >= 65 && correct <= 65 + answers) ||
        (correct >= 97 && correct <= 97 + answers);
  }

  List<Question> getQuestions() {
    return _questions;
  }

  List<String> getTopics() {
    return _topics;
  }

  List<int> getQuestionNumPerTopic() {
    return _qNumPerTopic;
  }

  bool hasTopics() {
    return _topicsPresent;
  }

  @override
  String toString() {
    String res = "";
    for (int i = 0; i < _questions.length; i++) {
      res += "Q${i + 1}) " + _questions[i].question + "\n";

      for (int j = 0; j < _questions[i].answers.length; j++) {
        res += Answer.values[j].toString() +
            ". " +
            _questions[i].answers[j] +
            "\n";
      }
      res += "\n";
    }

    return res;
  }
}
