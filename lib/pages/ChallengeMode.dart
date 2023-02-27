import 'package:flutter/material.dart';
import 'package:my_app/pages/widgets/RankItem.dart';
import './widgets/NavBar.dart';
import './widgets/NavButton.dart';

class Challenge extends StatefulWidget {
  static const routeName = '/Challenge';
  const Challenge(
      {super.key,
      required this.title,
      required this.name,
      required this.curscore});

  final String title, name;
  final int curscore;

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  List<int> scores = [
    120,
    100,
    90,
    70,
    30,
    10,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  List<String> Rnames = [
    'Kostakis',
    'Petrakis',
    'Giorgakis',
    'Agathoklis',
    'Aristofanis',
    'Aristotelis',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name'
  ];
  void addName(String name, int curscore) {
    int i = 11;
    while (i > -1 && curscore >= scores[i]) {
      i--;
    }
    i++;
    for (int j = 11; j > i; j--) {
      Rnames[j] = Rnames[j - 1];
      scores[j] = scores[j - 1];
    }
    Rnames[i] = name;
    scores[i] = curscore;
  }

  List<Widget> getRanking() {
    List<Widget> Ranks = [];
    for (int i = 0; i < 12; i++) {
      Ranks.add(RankItem(num: i + 1, name: Rnames[i], score: scores[i]));
      Ranks.add(Container(height: 10));
    }
    return Ranks;
  }

  @override
  Widget build(BuildContext context) {
    double heightsize = 80;
    if (widget.name != 'null') addName(widget.name, widget.curscore);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 2 * heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Challenge\nMode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 70,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      const Text('Challenge\nMode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                  height: heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Ranking',
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      const Text('Ranking',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: (MediaQuery.of(context).size.height -
                        6 * heightsize -
                        124) /
                    2,
              ),
              Container(
                height: 3 * heightsize,
                width: MediaQuery.of(context).size.width - 20,
                child: TextButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(210, 255, 255, 255),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        side: const BorderSide(width: 3, color: Colors.black)),
                    onPressed: () {},
                    child: Container(
                        child: ListView(
                      shrinkWrap: true,
                      children: getRanking(),
                    ))),
              ),
              Container(
                  height: (MediaQuery.of(context).size.height -
                          6 * heightsize -
                          124) /
                      2),
              Container(
                height: 50,
                child: NavButtonQuiz(
                    btext: 'Take Challenge',
                    next: 'QuizPage',
                    eP: () {},
                    type: 'Challenge'),
              ),
              Container(
                height: 20,
              ),
              Container(height: 54, child: NavBar(page: 2)),
            ],
          ),
        ),
      ),
    );
  }
}
