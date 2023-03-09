import 'package:flutter/material.dart';
import 'dart:async';

import 'src/pages/home.dart';

void main() {
  runApp(const Game());
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => GameState();  
}

class GameState extends State<Game>{

  static final _spells = ValueNotifier<BigInt>(BigInt.from(0));
  static ValueNotifier<BigInt> get spells => _spells;
  static final _gain = ValueNotifier<BigInt>(BigInt.from(1));
  static ValueNotifier<BigInt> get gain => _gain;

  static Timer? timer;

  static void _idleIncrease() {
    GameState._spells.value += GameState._gain.value;
  }

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => GameState._idleIncrease());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white, fontFamily: 'Courier'),
        iconTheme: const IconThemeData(color: Colors.white70),
      ),
      home: const HomePage(),
    );
  }

  @override
  void dispose(){
    GameState.timer?.cancel();
    super.dispose();
  }
}


