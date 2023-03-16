import 'package:evil_wizard_idle_game/src/pages/buildings.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'src/pages/home.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  static Timer? timer;
  final _gameState = GameState();

  @override
  void initState() {
    super.initState();
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
  void dispose() {
    _gameState.destroy();
    super.dispose();
  }
}

class GameState {
  static final GameState _gameState = GameState._internal();

  factory GameState() {
    debugPrint('in factory constructor');
    return _gameState;
  }

  GameState._internal() {
    debugPrint('in _internal()');
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => tick());

    debugPrint(buildings.keys.toList().join(','));
  }

  void destroy() {
    debugPrint("Destroying GameState object...");
    _timer?.cancel();
  }

  // Core currency management

  final _spells = ValueNotifier<BigInt>(BigInt.from(0));
  ValueNotifier<BigInt> get spells => _spells;
  final _gain = ValueNotifier<BigInt>(BigInt.from(1));
  ValueNotifier<BigInt> get gain => _gain;

  static Timer? _timer;

  void tick() {
    _spells.value += _gain.value;
  }

  void increaseGain(BigInt increase) {
    _gain.value += increase;
    debugPrint("Increasing _gain by $increase. New _gain = ${_gain.value}");
  }

  void spend(BigInt amount) {
    _spells.value -= amount;
    debugPrint("Spending $amount spells");
  }

  // Buildings management

  Map<String, Building> buildings = {
    'Grimoire': Building('Grimoire', BigInt.from(5), BigInt.from(2), const Icon(Icons.book)),
    'ScryingOrb': Building('Scrying Orb', BigInt.from(15), BigInt.from(5), const Icon(Icons.radio_button_unchecked)),
  };
}
