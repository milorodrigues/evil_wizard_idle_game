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
          children: [
            const Spacer(),
            const Text('You are an evil wizard.'),
            const Spacer(),
            InkWell(
              onTap: () {
                AppState.gameState.click();
              },
              child: const Text(Assets.asciiWizard),
            ),
            const Spacer(),
            const SpellsWidget(),
            const Spacer(),
            const IncreaseInfoWidget(),
            const Spacer(),
            const NavigationBarWidget()
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
            valueListenable: AppState.gameState.spells,
            builder: (context, value, widget) {
              return Text(AppState.gameState.spells.value.toString());
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
            valueListenable: AppState.gameState.gain,
            builder: (context, value, widget) {
              return Text('Casting ${AppState.gameState.gain.value} evil spells per second');
            }),
        ValueListenableBuilder(
            valueListenable: AppState.gameState.perclick,
            builder: (context, value, widget) {
              return Text('Casting ${AppState.gameState.perclick.value} evil spells per click');
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
