import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './widgets/OptionButton.dart';
import './widgets/Question.dart';
import './widgets/NavBar.dart';
import './widgets/NavButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ChallengeCompleted(
        title: 'Flutter Demo Home Page',
        score: 95,
      ),
    );
  }
}

class ChallengeCompleted extends StatefulWidget {
  const ChallengeCompleted(
      {super.key, required this.title, required this.score});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  final int score;
  @override
  State<ChallengeCompleted> createState() => _ChallengeCompletedState();
}

class _ChallengeCompletedState extends State<ChallengeCompleted> {
  List<String> quizes = [
    'WW1',
    'WW2',
    'Balkan Wars',
    'Byzantium',
    '1821',
    'Quiz 6',
    'Quiz 7',
    'Quiz 8'
  ];

  int _counter = 0;

  void _onPressed() {
    Navigator.pushNamed(context, "/Challenge");
  }

  List<Widget> getQuizes() {
    List<Widget> ChallengeCompletedNames = [];
    for (int i = 0; i < 8; i++) {
      ChallengeCompletedNames.add(NavButton(btext: quizes[i], next: quizes[i]));
      ChallengeCompletedNames.add(Container(height: 10));
    }
    return ChallengeCompletedNames;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double heightsize = 100;
    int score = widget.score;
    return Scaffold(
        /*appBar: AppBar(
          // Here we take the value from the ChallengeCompleted object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),*/
        body: GestureDetector(
      onTap: _onPressed,
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
                  height: 2 * heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Challenge\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text('Challenge\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height:
                    (MediaQuery.of(context).size.height - 5 * heightsize - 70) /
                        2,
              ),
              Container(
                height: 2 * heightsize,
                width: 200,
                child: TextButton(
                  //autofocus: false,
                  //clipBehavior: Clip.none,
                  style: ElevatedButton.styleFrom(
                      //backgroundColor: Colors.black,
                      primary: Color.fromARGB(210, 255, 255, 255),
                      //onPrimary: Colors.white,
                      //onSurface: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      side: BorderSide(width: 3, color: Colors.black)),
                  onPressed: () {},
                  child: Text('SCORE\n\n    $score',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      )),
                ),
              ),
              Container(
                height:
                    (MediaQuery.of(context).size.height - 5 * heightsize - 70) /
                        2,
              ),
              Container(
                height: 50,
                width: 500,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    hintText: 'user',
                    labelText: 'Enter your name',
                    filled: true,
                    fillColor: Color.fromARGB(210, 255, 255, 255),
                  ),
                  controller: TextEditingController(),
                ),
              ),
              Container(height: 20),
              Container(
                height: heightsize,
                child: Stack(
                  children: <Widget>[
                    Text('Click anywhere to continue',
                        style: TextStyle(
                          fontSize: 15,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.black,
                        )),
                    Text('Click anywhere to continue',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
        /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Color.fromARGB(210, 255, 255, 255),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.purple,
        ),
      ),*/
        );
  }
}
