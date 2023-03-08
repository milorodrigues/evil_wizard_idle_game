import 'package:flutter/material.dart';
import 'dart:async';

import './src/asciiart.dart';

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
  static final _gain = ValueNotifier<BigInt>(BigInt.from(1));
  static Timer? timer;

  static void _idleIncrease() {
    GameState._spells.value += GameState._gain.value;
    //debugPrint("in _idleIncrease; _spells = ${GameState._spells.value}");
  }

  @override
  void initState(){
    //debugPrint("in initState()");
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

  @override
  void dispose(){
    GameState.timer?.cancel();
    super.dispose();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Spacer(),
              Text('You are an evil wizard.'),
              Spacer(),
              Text(Assets.asciiWizard),
              Spacer(),
              SpellsWidget(),
              Spacer(),
              IncreaseInfoWidget(),
              Spacer(),
            ],
          ),
        ),
      )
    );
  }
}

class SpellsWidget extends StatefulWidget {
  const SpellsWidget({super.key});
  
  @override
  State<StatefulWidget> createState() => SpellsWidgetState();
}

class SpellsWidgetState extends State<SpellsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: GameState._spells,
          builder: (context, value, widget) {return Text(GameState._spells.value.toString());}),
        const Text('evil spells'),
      ],
    );
  }
}

class IncreaseInfoWidget extends StatefulWidget {
  const IncreaseInfoWidget({super.key});
  
  @override
  State<StatefulWidget> createState() => IncreaseInfoWidgetState();
}

class IncreaseInfoWidgetState extends State<IncreaseInfoWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: GameState._gain,
          builder: (context, value, widget) {return Text('Casting ${GameState._gain.value} evil spells per second');}),
      ],
    );
  }
}

