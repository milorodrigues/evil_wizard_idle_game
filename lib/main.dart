import 'package:flutter/material.dart';
import 'dart:async';

//import './src/asciiart.dart';

void main() {
  runApp(const Game());
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => GameState();  
}

class GameState extends State<Game>{
  static var _spells = BigInt.from(0);
  static var _gain = BigInt.from(1);
  static Timer? timer;

  static void _idleIncrease() {
    GameState._spells += GameState._gain;
    debugPrint("in _idleIncrease; _spells = ${GameState._spells}");
  }

  @override
  void initState(){
    debugPrint("in initState()");
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => GameState._idleIncrease());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white, fontFamily: 'Courier'),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: const [
            Text('You are an evil wizard.'),
            //Text(Assets.asciiWizard),
            SpellsWidget(),
          ],
        ),
      )
    );
  }
}

class SpellsWidget extends StatelessWidget {
  const SpellsWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(GameState._spells.toString()),
        const Text('spells'),
      ],
    );
  }
}

