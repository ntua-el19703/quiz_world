import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './widgets/OptionButton.dart';
import './widgets/Question.dart';
import 'package:event/event.dart';
import './QuizCompleted.dart';
import './widgets/Arguments.dart';

class QuizPage extends StatefulWidget {
  static const routeName = '/QuizPage';
  const QuizPage({
    super.key,
    required this.title,
    required this.quiztitle,
    required this.type,
    required this.score,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title, quiztitle, type;
  final int score;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _counter = 0, answered = 0, score = 0;
  String type = "";

  //OptionSelected.subscribe( (args) => answered=1);

  void _onPressed(int cor) {
    if (cor == 1)
      setState(() {
        answered = 11;
      });
    else
      setState(() {
        answered = 1;
      });
  }

  void _onPressedNext() {
    if (answered > 0)
      Navigator.pushNamed(context, "/" + type + "Completed",
          arguments: QuizScore(score + answered - 1));
  }

  @override
  Widget build(BuildContext context) {
    score = widget.score;
    String title = widget.quiztitle;
    type = widget.type;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double heightsize = 100;
    return Scaffold(
        /*appBar: AppBar(
          // Here we take the value from the QuizPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),*/
        body: GestureDetector(
      onTap: _onPressedNext,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text(title,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height:
                    (MediaQuery.of(context).size.height - 5 * heightsize) / 3,
              ),
              Container(
                  height: 4 * heightsize,
                  child: Question(
                    qtext: 'x-2=2. x=',
                    opt1t: '2',
                    opt2t: '3',
                    opt3t: '4',
                    opt4t: '5',
                    cor: 3,
                    qnum: 1,
                    eP: _onPressed,
                    ePN: _onPressedNext,
                  )),
            ],
          ),
        ),
      ),
    )
        /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      */ // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
