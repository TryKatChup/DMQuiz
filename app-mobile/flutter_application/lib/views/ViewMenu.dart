import 'package:flutter/material.dart';
import 'package:dmquiz/model/Question.dart';
import 'package:dmquiz/persistence/QuestionRepository.dart';
import 'package:dmquiz/model/Settings.dart';
import 'package:dmquiz/views/ViewQuiz.dart';
import 'package:dmquiz/views/ViewSettings.dart';
import 'package:dmquiz/views/ViewTopics.dart';
import 'package:dmquiz/views/ViewInfo.dart';
import 'package:dmquiz/model/Themes.dart';
import 'package:dmquiz/widget/icon_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewMenu extends StatefulWidget {
  const ViewMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ViewMenuState();
}

class ViewMenuState extends State<ViewMenu> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final QuestionRepository qRepo = QuestionRepository();
  final Settings _settings = Settings();
  final List<bool> _selectedTopics = [];
  int _quizPool = 0;

  late Future<int> _quizQuestionNumber;
  late Future<int> _timer;

  void _initTopics() {
    setState(() {
      for (int i = 0; i < qRepo.topics.length; i++) {
        _selectedTopics.add(true);
      }
    });
  }

  void resetTopics() {
    setState(() {
      for (int i = 0; i < _selectedTopics.length; i++) {
        _selectedTopics[i] = true;
      }
      _quizPool = qRepo.questions.length;
    });
  }

  List<Question> _getPoolFromSelected() {
    if (!qRepo.topicsPresent) {
      return qRepo.questions;
    }

    List<Question> res = [];
    for (int i = 0, j = 0; i < _selectedTopics.length; i++) {
      if (_selectedTopics[i]) {
        for (int k = 0; k < qRepo.getQuestionNumPerTopic()[i]; j++, k++) {
          res.add(qRepo.getQuestions()[j]);
        }
      } else {
        j += qRepo.getQuestionNumPerTopic()[i];
      }
    }

    return res;
  }

  void updateQuizPool(int v) {
    setState(() {
      _quizPool = v;
    });
  }

  void saveSettings(int qNum, int timer, bool shuffle, bool dTheme) {
    setState(() {
      _settings.questionNumber = qNum;
      _settings.timer = timer;
      _settings.shuffleAnswers = shuffle;
      _settings.darkTheme = dTheme;
      _settings.saveSettings();
      if (qRepo.topicsPresent) {
        resetTopics();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _settings.loadSettings();
    qRepo.loadFile("assets/domande.txt").then(
          (value) => {
            setState(
              () {
                _quizPool = qRepo.questions.length;
                if (qRepo.hasTopics()) {
                  _initTopics();
                }
              },
            ),
          },
        );

    _quizQuestionNumber = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt("questionNumber") ?? -1;
    });
    _timer = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt("timer") ?? -1;
    });
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<List>(
              future: Future.wait([_quizQuestionNumber, _timer]),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(flex: 2),
                              const Text(Settings.APP_TITLE,
                                  style: TextStyle(
                                    fontSize: 54,
                                    fontWeight: FontWeight
                                        .bold, /*fontStyle: FontStyle.italic*/
                                  )),
                              const Text(
                                "v${Settings.APP_VERSION}",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(flex: 1),
                              // BUTTONS
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: ElevatedButton(
                                  onPressed: qRepo.questions.isEmpty
                                      ? null
                                      : () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewQuiz(
                                                        questions:
                                                            _getPoolFromSelected(),
                                                        settings: _settings,
                                                      )));
                                        },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    child: const Text(
                                      "Avvia",
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: ElevatedButton(
                                  onPressed: qRepo.topicsPresent
                                      ? () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewTopics(
                                                        qRepo: qRepo,
                                                        settings: _settings,
                                                        updateQuizPool:
                                                            updateQuizPool,
                                                        selectedTopics:
                                                            _selectedTopics,
                                                      )));
                                        }
                                      : null,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    child: const Text(
                                      "Argomenti",
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.format_list_numbered_rounded,
                                    ),
                                    Text(
                                        "Domande: ${_settings.questionNumber} su $_quizPool"),
                                    const SizedBox(width: 20),
                                    const Icon(
                                      Icons.timer_rounded,
                                    ),
                                    Text("Tempo: ${_settings.timer} min"),
                                  ]),
                              const SizedBox(height: 50),
                              InkWell(
                                onTap: () {
                                  _launchInBrowser(
                                      "https://github.com/mikyll/ROQuiz");
                                },
                                child: Container(
                                  color: Colors.indigo.withOpacity(0.35),
                                  height: 120,
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                        "Se l'app ti è piaciuta, considera di lasciare una stellina alla repository GitHub!\n\nBasta un click qui!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                  ),
                                ),
                              ),
                              const Spacer(flex: 5),
                            ],
                          ));
                    }
                }
              })),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButtonWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewSettings(
                            qRepo: qRepo,
                            settings: _settings,
                            saveSettings: saveSettings,
                          )));
            },
            width: 60.0,
            height: 60.0,
            lightPalette: MyThemes.lightIconButtonPalette,
            darkPalette: MyThemes.darkIconButtonPalette,
            icon: Icons.settings,
            iconSize: 40,
          ),
          const SizedBox(height: 10.0),
          IconButtonWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewInfo(settings: _settings)));
            },
            width: 60.0,
            height: 60.0,
            lightPalette: MyThemes.lightIconButtonPalette,
            darkPalette: MyThemes.darkIconButtonPalette,
            icon: Icons.info,
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
