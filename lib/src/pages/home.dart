import 'package:evil_wizard_idle_game/src/pages/ascension.dart';
import 'package:evil_wizard_idle_game/src/pages/buildings.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../asciiart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            NavigationBarWidget()
          ],
        ),
      ),
    ));
  }
}

class SpellsWidget extends StatefulWidget {
  const SpellsWidget({super.key});

  @override
  State<StatefulWidget> createState() => SpellsWidgetState();
}

class SpellsWidgetState extends State<SpellsWidget> {
  final GameState _gameState = GameState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
            valueListenable: _gameState.spells,
            builder: (context, value, widget) {
              return Text(_gameState.spells.value.toString());
            }),
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

class IncreaseInfoWidgetState extends State<IncreaseInfoWidget> {
  final GameState _gameState = GameState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
            valueListenable: _gameState.gain,
            builder: (context, value, widget) {
              return Text('Casting ${_gameState.gain.value} evil spells per second');
            }),
      ],
    );
  }
}

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.menu_book),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => const BuildingsPage()))},
        ),
        IconButton(
          icon: const Icon(Icons.diamond),
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => const AscensionPage()))},
        ),
        IconButton(
          icon: const Icon(Icons.save_alt),
          onPressed: () => {},
        ),
      ],
    );
  }
}
